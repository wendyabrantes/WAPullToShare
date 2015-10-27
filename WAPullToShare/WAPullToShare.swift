//
//  ITPullToShare.swift
//  ITPullToShareExample
//
//  Created by Wendy Abrantes on 25/10/2015.
//  Copyright © 2015 Wendy Abrantes. All rights reserved.
//

import UIKit

enum WAPullToShareButtonType : Int{
    case googlePlus
    case pinterest
    case twitter
    case facebook
    
    func iconNormal() -> UIImage{
        switch self {
        case .googlePlus:
            return WAPullToShareStyleKit.imageOfGooglePlus
        case .pinterest:
            return WAPullToShareStyleKit.imageOfPinterest
        case .twitter:
            return WAPullToShareStyleKit.imageOfTwitter
        case .facebook:
            return WAPullToShareStyleKit.imageOfFacebook
        }
    }

}

public class WAPullToShareScrollView : UIScrollView, UIScrollViewDelegate {
    
    public var containerBackgroundColor : UIColor = UIColor(red: 0.238, green: 0.238, blue: 0.238, alpha: 1.000)
    public var circleSelectionColor : UIColor = UIColor(red: 0.227, green: 0.569, blue: 1.000, alpha: 1.000)
    public var buttonTintColor : UIColor = UIColor.whiteColor()
    
    let circleSize : CGFloat = 60.0
    let iconSize : CGFloat = 48.0
    let buttonViewHeight : CGFloat = 300
    var containerView = UIView()
    
    var icons : [UIButton] = []
    var isLayoutSubview = false
    var pullThresholdValue : CGFloat = -60
    
    var circleLayer = CAShapeLayer()
    var iconSelectedIndex : Int = 0
    
    //var block selectedItem
    var buttonSelectedCallback:((UIButton, WAPullToShareButtonType) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    convenience init(){
        self.init(frame: CGRect.zero)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addShareIcons(iconTypes: [WAPullToShareButtonType]){

        icons = []
        for iconType in iconTypes {
            let btn = UIButton()
            btn.tag = iconType.hashValue
            btn.tintColor = buttonTintColor
            btn.setImage(iconType.iconNormal(), forState: UIControlState.Normal)
            btn.tintColor = UIColor.whiteColor()
            //btn.setImage(UIImage(named: iconType.iconSelected()), forState: UIControlState.Selected)
            containerView.addSubview(btn)
            icons += [btn]
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        if !isLayoutSubview {

            containerView.frame.size = CGSize(width: frame.width, height: buttonViewHeight)
            
            var index = 0
            let btnWidth = containerView.frame.width / CGFloat(icons.count)
            for btn in icons {
                btn.frame =  CGRect(
                    x: CGFloat(index)*btnWidth,
                    y: containerView.frame.height - (circleSize),
                    width: btnWidth,
                    height: iconSize)
                index++
            }
            isLayoutSubview = true
        }
    }
    
    
    func setupLayout(){
        delegate = self

        alwaysBounceVertical = true
        
        contentInset = UIEdgeInsetsMake(-buttonViewHeight, 0, 0, 0)
        circleLayer.anchorPoint = CGPointMake(0.5, 0.5)
        circleLayer.frame = CGRectMake(0, 0, circleSize, circleSize)
        
        circleLayer.path = circleCurrentPath().CGPath
        circleLayer.fillColor = circleSelectionColor.CGColor
        circleLayer.zPosition = -1
        containerView.layer.addSublayer(circleLayer)
        
        panGestureRecognizer.maximumNumberOfTouches = 1
        panGestureRecognizer.addTarget(self, action: Selector("panGestureHandler:"))
        
        containerView.backgroundColor = containerBackgroundColor
        containerView.layer.masksToBounds = true
       
        addSubview(containerView)
    }
    
    let threshold : CGFloat = 30.0
    var isAnimating = false

    func panGestureHandler(gesture: UIPanGestureRecognizer)
    {
        let location = gesture.locationInView(self)
        let translation = gesture.translationInView(self)
        let offsetY = contentOffset.y + contentInset.top
        
        if gesture.state == UIGestureRecognizerState.Began || gesture.state == UIGestureRecognizerState.Changed {

            if offsetY <= pullThresholdValue {
                

                
                var index = 0
                var newIndex : Int = -1
                for btn in icons {
                    
                    if CGRectContainsPoint(btn.frame, CGPoint(x: location.x, y: btn.frame.origin.y)) {
                        newIndex = index
                    }
                    index++
                }
                
                if iconSelectedIndex == -1 && newIndex != -1{
                    circleLayer.position = CGPointMake( (icons[newIndex].center.x), icons[newIndex].center.y)
                    iconSelectedIndex = newIndex
                }
                
                circleAppear()

                
                //change bezier path shape left /right
                if !isAnimating && iconSelectedIndex != -1 {
                    
                    leftOffset = min(translation.x/2,0)
                    leftOffset = max(leftOffset, -threshold)
                    
                    rightOffset = max(translation.x/2,0)
                    rightOffset = min(rightOffset, threshold)
                    
                    circleLayer.path = circleCurrentPath().CGPath
                    circleLayer.position = CGPointMake( (icons[iconSelectedIndex].center.x) + leftOffset/4 + rightOffset/4, circleLayer.position.y)

                }
                
                //animate to new selected item
                if !isAnimating && (translation.x > threshold || translation.x < -threshold){
                   
                    if newIndex != iconSelectedIndex {
                        NSLog("animated trigger")
                        isAnimating = true
                        //animate to nex index
                        gesture.setTranslation(CGPointMake(0,translation.y), inView: self)
                        iconSelectedIndex = newIndex
                        animateToIndex()
                    }
                }
            }else{
                resetPanGestureTranslation()
                deselectItem()
            }
        }
        
        if gesture.state == UIGestureRecognizerState.Ended || gesture.state == UIGestureRecognizerState.Cancelled {
            if offsetY <= pullThresholdValue {
                //trigger selected
                selectItem()
            }else{
                //reset
                deselectItem()
            }
        }
    }
    
    var currentPoint : CGPoint = CGPointZero
    var leftOffset: CGFloat = 0.0
    var rightOffset: CGFloat = 0.0
    var leftPoint : CGPoint!
    var topPoint : CGPoint!
    var rightPoint : CGPoint!
    var bottomPoint : CGPoint!
    /// circle animation
    
    func animateToIndex(){
    
        isAnimating = true
        self.rightOffset = 0
        self.leftOffset = 0

        let layerAnimation = CABasicAnimation(keyPath: "position")
        layerAnimation.fromValue = NSValue(CGPoint:circleLayer.position)
        layerAnimation.toValue = NSValue(CGPoint:CGPointMake(icons[iconSelectedIndex].center.x, icons[iconSelectedIndex].center.y))
        circleLayer.position = CGPointMake(icons[iconSelectedIndex].center.x, icons[iconSelectedIndex].center.y)

        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = circleLayer.path
        pathAnimation.toValue = circleCurrentPath().CGPath
        circleLayer.path = circleCurrentPath().CGPath
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 0.3
        groupAnimation.animations = [layerAnimation, pathAnimation]
        groupAnimation.delegate = self
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circleLayer.addAnimation(groupAnimation, forKey: "selectedIndex")
    }
    
    public override func animationDidStart(anim: CAAnimation) {
    }
    
    public override func animationDidStop(anim: CAAnimation, finished flag: Bool) {

        self.rightOffset = 0
        self.leftOffset = 0
        resetPanGestureTranslation()
        isAnimating = false
    }
    
    func resetPanGestureTranslation(){
        let translation = panGestureRecognizer.translationInView(self)
        panGestureRecognizer.setTranslation(CGPointMake(0, translation.y), inView: self)
    }
    
    func circleCurrentPath() -> UIBezierPath {
        
        leftPoint = CGPoint(x: leftOffset, y: circleSize/2)
        rightPoint = CGPoint(x: circleSize+rightOffset, y: circleSize/2)
        //direction left right
        if fabs(leftOffset) > fabs(rightOffset){
            topPoint = CGPoint(x: circleSize/2 + rightOffset, y: 0)
            bottomPoint = CGPoint(x: circleSize/2 + rightOffset, y: circleSize)
        }else{
            topPoint = CGPoint(x: circleSize/2 + leftOffset, y: 0)
            bottomPoint = CGPoint(x: circleSize/2 + leftOffset, y: circleSize)
        }
    
        //control point
        let controlPointLeft : CGFloat = topPoint.x - leftPoint.x
        let controlPointRight : CGFloat = rightPoint.x - topPoint.x
        
        let path = UIBezierPath()
        path.moveToPoint(leftPoint)
        
        //top
        path.addCurveToPoint(
            topPoint,
            controlPoint1: CGPoint(x: leftPoint.x, y: leftPoint.y - (controlPointLeft/2)),
            controlPoint2: CGPoint(x: topPoint.x  - (controlPointLeft/2), y: topPoint.y))
        

        //right
        path.addCurveToPoint(
            rightPoint,
            controlPoint1: CGPoint(x: topPoint.x  + (controlPointRight/2), y: topPoint.y),
            controlPoint2: CGPoint(x: rightPoint.x, y: rightPoint.y - (controlPointRight/2)))
        
        //bottom
        path.addCurveToPoint(
            bottomPoint,
            controlPoint1: CGPoint(x: rightPoint.x, y: rightPoint.y + (controlPointRight/2)),
            controlPoint2: CGPoint(x: bottomPoint.x + (controlPointRight/2), y: bottomPoint.y))

        //left
        path.addCurveToPoint(
            leftPoint,
            controlPoint1: CGPoint(x: bottomPoint.x - (controlPointRight/2), y: bottomPoint.y ),
            controlPoint2: CGPoint(x: leftPoint.x, y: leftPoint.y + (controlPointLeft/2)))

        path.closePath()

        return path
    }
    
    func circleAppear(){
        circleLayer.transform = CATransform3DMakeScale(1.0, 1.0, 0.0)
        circleLayer.opacity = 1.0
    }
    func circleDisappear(){
        circleLayer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        circleLayer.opacity = 0.0
    }
    
    func selectItem(){
        let transform = circleLayer.transform
        circleLayer.transform = CATransform3DScale(transform, 10.0, 10.0, 0.0)

        if iconSelectedIndex != -1 && buttonSelectedCallback != nil {

            buttonSelectedCallback!( icons[iconSelectedIndex], WAPullToShareButtonType(rawValue: icons[iconSelectedIndex].tag)!)
        }
    }
    
    func deselectItem(){
        iconSelectedIndex = -1
        circleLayer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        circleLayer.opacity = 0.0
    }

    
    
}
