//
//  ITPullToShare.swift
//  ITPullToShareExample
//
//  Created by Wendy Abrantes on 25/10/2015.
//  Copyright © 2015 Wendy Abrantes. All rights reserved.
//

import UIKit

class WAContainerView : UIView {
    
    var circleSelectionColor = UIColor(red: 0.227, green: 0.569, blue: 1.000, alpha: 1.000)
    var circleShapeLayer = CAShapeLayer()
    
    var displayLink = CADisplayLink()
    
    var currentLocation = CGPoint.zero
    var currentTranslation = CGPoint.zero
    
    var items : [UIButton] = []
    
    let circleSize : CGFloat = 60.0
    let iconSize : CGFloat = 48.0
    let buttonViewHeight : CGFloat = 300
    
    var isLayoutSubview = false
    
    var previousItem : UIButton?
    var stickyItem : UIButton?
    
    var changeIndexCompletion:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(){
        self.init(frame: CGRect.zero)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        
        UIView.setAnimationWillStartSelector(Selector("animationWillStart:anim"))
        UIView.setAnimationDidStopSelector(Selector("animationDidStop:anim:finished:"))
        
        self.displayLink = CADisplayLink(target: self, selector: Selector("checkCollision"))
        self.displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        circleShapeLayer.anchorPoint = CGPointMake(0.5, 0.5)
        circleShapeLayer.frame = CGRectMake(0, 0, circleSize, circleSize)
        circleShapeLayer.path = circleCurrentPath().CGPath
        circleShapeLayer.fillColor = circleSelectionColor.CGColor
        circleShapeLayer.zPosition = -1
        layer.addSublayer(circleShapeLayer)
        
    }
    
    var currentPoint : CGPoint = CGPointZero
    var leftOffset: CGFloat = 0.0
    var rightOffset: CGFloat = 0.0
    var leftPoint : CGPoint!
    var topPoint : CGPoint!
    var rightPoint : CGPoint!
    var bottomPoint : CGPoint!
    let threshold : CGFloat = 30.0
    
    //current bezier path
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
            controlPoint1: CGPoint(x: bottomPoint.x - (controlPointLeft/2), y: bottomPoint.y ),
            controlPoint2: CGPoint(x: leftPoint.x, y: leftPoint.y + (controlPointLeft/2)))
        
        path.closePath()
        
        return path
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isLayoutSubview {
            
            var index = 0
            let btnWidth = frame.width / CGFloat(items.count)
            for btn in items {
                btn.frame =  CGRect(
                    x: CGFloat(index)*btnWidth,
                    y: frame.height - (circleSize),
                    width: btnWidth,
                    height: iconSize)
                index++
            }
            isLayoutSubview = true
        }
    }
    
    var needChangeIndex = true
    
    func checkCollision(){

        needChangeIndex = false
        
        //check current index
        for currentItem in items where CGRectContainsPoint(currentItem.frame, CGPointMake(currentLocation.x, currentItem.frame.origin.y)){
            if currentItem != stickyItem {
                stickyItem = currentItem
                needChangeIndex = true
            }
        }
        
        if let _ = stickyItem where isAnimating == false {
           //do the biezer path thing
            leftOffset = currentTranslation.x
            rightOffset = currentTranslation.x
            
            leftOffset = min(leftOffset,0)
            //leftOffset = max(leftOffset, -threshold)
            
            rightOffset = max(rightOffset,0)
            //rightOffset = min(rightOffset, threshold)
            
            circleShapeLayer.path = circleCurrentPath().CGPath
         
        }
        
        if needChangeIndex {
            changeIndex()
        }
    }
    
    func resetOffset(){
        
        currentTranslation = CGPoint.zero
        leftOffset = 0
        rightOffset = 0
        
        
    }
    
    func changeIndex(){
        if let _ = stickyItem {
            isAnimating = true
            animateToIndex()
        }
    }

    var isAnimating = false
    
    func animateToIndex(){
        
        circleShapeLayer.removeAllAnimations()
        resetOffset()

        if let item = stickyItem {
            
        let layerAnimation = CABasicAnimation(keyPath: "position")
        if let presentationLayer = circleShapeLayer.presentationLayer() where presentationLayer.center != nil {
            layerAnimation.fromValue = NSValue(CGPoint:presentationLayer.center)
        }else{
            layerAnimation.fromValue = NSValue(CGPoint:circleShapeLayer.position)
        }
        layerAnimation.toValue = NSValue(CGPoint:CGPointMake(item.center.x, item.center.y))
        circleShapeLayer.position = CGPointMake(item.center.x, item.center.y)

            
        let pathAnimation = CABasicAnimation(keyPath: "path")
        if let p = circleShapeLayer.presentationLayer() {
            pathAnimation.fromValue = p.path
        }else{
            pathAnimation.fromValue = self.circleShapeLayer.path
        }
        
        pathAnimation.toValue = circleCurrentPath().CGPath
        circleShapeLayer.path = circleCurrentPath().CGPath
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 0.3
        groupAnimation.animations = [pathAnimation, layerAnimation]
        groupAnimation.delegate = self
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        circleShapeLayer.addAnimation(groupAnimation, forKey: "selectedIndex")
            
        }
    }
    
    override func animationDidStart(anim: CAAnimation) {

    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        //if anim cancel dont dispatch
        if flag {
                self.changeIndexCompletion!()
                self.isAnimating = false
                self.needChangeIndex = false

        }
    }
    
    //select item
    
    //deselect item
    
    func circleAppear(){
        CATransaction.begin()
        circleShapeLayer.transform = CATransform3DMakeScale(1.0, 1.0, 0.0)
        circleShapeLayer.opacity = 1.0
        CATransaction.commit()
    }
    func circleDisappear(){
        CATransaction.begin()
        circleShapeLayer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        circleShapeLayer.opacity = 0.0
        CATransaction.commit()
    }
    
    func selectItem(){
        let transform = circleShapeLayer.transform
        circleShapeLayer.transform = CATransform3DScale(transform, 10.0, 10.0, 0.0)
        
//        if let item = stickyItem {
//            changeIndexCompletion!( item, WAPullToShareButtonType(rawValue: item.tag)!)
//        }
    }
    
    func deselectItem(){
        stickyItem = nil
        circleDisappear()
    }

}

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
    
    var containerView = WAContainerView()
    
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
    
    init(){
        super.init(frame: CGRect.zero)
        setupLayout()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addShareIcons(iconTypes: [WAPullToShareButtonType]){
        
        for iconType in iconTypes {
            let btn = UIButton()
            btn.tag = iconType.hashValue
            btn.tintColor = buttonTintColor
            btn.setImage(iconType.iconNormal(), forState: UIControlState.Normal)
            btn.tintColor = UIColor.whiteColor()
            containerView.addSubview(btn)
            containerView.items += [btn]
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isLayoutSubview {
            
            containerView.frame.size = CGSize(width: frame.width, height: buttonViewHeight)
            isLayoutSubview = true
        }
    }
    
    
    func setupLayout(){
        delegate = self
        
        alwaysBounceVertical = true
        
        contentInset = UIEdgeInsetsMake(-buttonViewHeight, 0, 0, 0)

        panGestureRecognizer.maximumNumberOfTouches = 1
        panGestureRecognizer.addTarget(self, action: Selector("panGestureHandler:"))
        
        containerView.backgroundColor = containerBackgroundColor
        containerView.layer.masksToBounds = true
        
        containerView.changeIndexCompletion = { () -> Void in
            self.resetPanGestureTranslation()
            self.containerView.resetOffset()
        }
        
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
                containerView.circleAppear()
                containerView.displayLink.paused = false
                
                containerView.currentLocation = location
                containerView.currentTranslation = translation
                
            }else{
                containerView.displayLink.paused = true
                containerView.stickyItem = nil
                containerView.resetOffset()
                //cancel selection
                containerView.deselectItem()
            }
        }
        
        if gesture.state == UIGestureRecognizerState.Ended || gesture.state == UIGestureRecognizerState.Cancelled {
            containerView.displayLink.paused = false
            //select item
            containerView.selectItem()
            if let _ = buttonSelectedCallback {
                if let _ = containerView.stickyItem {
                    buttonSelectedCallback!(containerView.stickyItem!, WAPullToShareButtonType(rawValue: containerView.stickyItem!.tag)!)
                }
            }
        }
    }
    
    func resetPanGestureTranslation(){
        let translation = panGestureRecognizer.translationInView(self)
        panGestureRecognizer.setTranslation(CGPointMake(0, translation.y), inView: self)
    }
}
