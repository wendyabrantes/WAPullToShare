//
//  ITPullToShareStyleKit.swift
//  ITPullToShare
//
//  Created by WendyAbrantes on 26/10/2015.
//  Copyright (c) 2015 Abrantes Digital. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class WAPullToShareStyleKit : NSObject {

    //// Cache

    private struct Cache {
        static var imageOfFacebook: UIImage?
        static var facebookTargets: [AnyObject]?
        static var imageOfGooglePlus: UIImage?
        static var googlePlusTargets: [AnyObject]?
        static var imageOfPinterest: UIImage?
        static var pinterestTargets: [AnyObject]?
        static var imageOfTwitter: UIImage?
        static var twitterTargets: [AnyObject]?
    }

    //// Drawing Methods
    public class func drawCanvas1() {
        //// Color Declarations
        let color = UIColor(red: 0.238, green: 0.238, blue: 0.238, alpha: 1.000)
        let color2 = UIColor(red: 0.960, green: 0.960, blue: 0.960, alpha: 1.000)

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRectMake(0, 36, 103, 84))
        color2.setFill()
        rectanglePath.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRectMake(0, -48, 103, 84))
        color.setFill()
        rectangle2Path.fill()
    }

    public class func drawFacebook() {
        //// Color Declarations
        let fillColor = UIColor(red: 0.043, green: 0.043, blue: 0.039, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(12.82, 24))
        bezierPath.addLineToPoint(CGPointMake(1.32, 24))
        bezierPath.addCurveToPoint(CGPointMake(0, 22.68), controlPoint1: CGPointMake(0.59, 24), controlPoint2: CGPointMake(0, 23.41))
        bezierPath.addLineToPoint(CGPointMake(0, 1.32))
        bezierPath.addCurveToPoint(CGPointMake(1.32, 0), controlPoint1: CGPointMake(0, 0.59), controlPoint2: CGPointMake(0.59, 0))
        bezierPath.addLineToPoint(CGPointMake(22.68, 0))
        bezierPath.addCurveToPoint(CGPointMake(24, 1.32), controlPoint1: CGPointMake(23.41, 0), controlPoint2: CGPointMake(24, 0.59))
        bezierPath.addLineToPoint(CGPointMake(24, 22.68))
        bezierPath.addCurveToPoint(CGPointMake(22.68, 24), controlPoint1: CGPointMake(24, 23.41), controlPoint2: CGPointMake(23.41, 24))
        bezierPath.addLineToPoint(CGPointMake(16.56, 24))
        bezierPath.addLineToPoint(CGPointMake(16.56, 14.71))
        bezierPath.addLineToPoint(CGPointMake(19.68, 14.71))
        bezierPath.addLineToPoint(CGPointMake(20.15, 11.08))
        bezierPath.addLineToPoint(CGPointMake(16.56, 11.08))
        bezierPath.addLineToPoint(CGPointMake(16.56, 8.77))
        bezierPath.addCurveToPoint(CGPointMake(18.35, 7.01), controlPoint1: CGPointMake(16.56, 7.72), controlPoint2: CGPointMake(16.85, 7.01))
        bezierPath.addLineToPoint(CGPointMake(20.27, 7.01))
        bezierPath.addLineToPoint(CGPointMake(20.27, 3.77))
        bezierPath.addCurveToPoint(CGPointMake(17.48, 3.62), controlPoint1: CGPointMake(19.94, 3.72), controlPoint2: CGPointMake(18.8, 3.62))
        bezierPath.addCurveToPoint(CGPointMake(12.82, 8.41), controlPoint1: CGPointMake(14.71, 3.62), controlPoint2: CGPointMake(12.82, 5.31))
        bezierPath.addLineToPoint(CGPointMake(12.82, 11.08))
        bezierPath.addLineToPoint(CGPointMake(9.69, 11.08))
        bezierPath.addLineToPoint(CGPointMake(9.69, 14.71))
        bezierPath.addLineToPoint(CGPointMake(12.82, 14.71))
        bezierPath.addLineToPoint(CGPointMake(12.82, 24))
        bezierPath.addLineToPoint(CGPointMake(12.82, 24))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;

        fillColor.setFill()
        bezierPath.fill()
    }

    public class func drawGooglePlus() {
        //// Color Declarations
        let fillColor = UIColor(red: 0.043, green: 0.043, blue: 0.039, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(29.37, 8.63))
        bezierPath.addLineToPoint(CGPointMake(29.37, 4.99))
        bezierPath.addLineToPoint(CGPointMake(26.77, 4.99))
        bezierPath.addLineToPoint(CGPointMake(26.77, 8.63))
        bezierPath.addLineToPoint(CGPointMake(23.04, 8.63))
        bezierPath.addLineToPoint(CGPointMake(23.04, 11.23))
        bezierPath.addLineToPoint(CGPointMake(26.77, 11.23))
        bezierPath.addLineToPoint(CGPointMake(26.77, 14.97))
        bezierPath.addLineToPoint(CGPointMake(29.37, 14.97))
        bezierPath.addLineToPoint(CGPointMake(29.37, 11.23))
        bezierPath.addLineToPoint(CGPointMake(33, 11.23))
        bezierPath.addLineToPoint(CGPointMake(33, 8.63))
        bezierPath.addLineToPoint(CGPointMake(29.37, 8.63))
        bezierPath.addLineToPoint(CGPointMake(29.37, 8.63))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(10.48, 8.42))
        bezierPath.addLineToPoint(CGPointMake(10.48, 12.58))
        bezierPath.addCurveToPoint(CGPointMake(16.15, 12.57), controlPoint1: CGPointMake(10.48, 12.58), controlPoint2: CGPointMake(14.51, 12.57))
        bezierPath.addCurveToPoint(CGPointMake(10.48, 16.74), controlPoint1: CGPointMake(15.26, 15.27), controlPoint2: CGPointMake(13.88, 16.74))
        bezierPath.addCurveToPoint(CGPointMake(4.36, 10.5), controlPoint1: CGPointMake(7.04, 16.74), controlPoint2: CGPointMake(4.36, 13.94))
        bezierPath.addCurveToPoint(CGPointMake(10.48, 4.26), controlPoint1: CGPointMake(4.36, 7.06), controlPoint2: CGPointMake(7.04, 4.26))
        bezierPath.addCurveToPoint(CGPointMake(14.55, 5.79), controlPoint1: CGPointMake(12.3, 4.26), controlPoint2: CGPointMake(13.47, 4.9))
        bezierPath.addCurveToPoint(CGPointMake(17.53, 2.73), controlPoint1: CGPointMake(15.41, 4.93), controlPoint2: CGPointMake(15.34, 4.81))
        bezierPath.addCurveToPoint(CGPointMake(10.48, 0), controlPoint1: CGPointMake(15.67, 1.04), controlPoint2: CGPointMake(13.2, 0))
        bezierPath.addCurveToPoint(CGPointMake(0, 10.5), controlPoint1: CGPointMake(4.69, 0), controlPoint2: CGPointMake(0, 4.7))
        bezierPath.addCurveToPoint(CGPointMake(10.48, 21), controlPoint1: CGPointMake(0, 16.3), controlPoint2: CGPointMake(4.69, 21))
        bezierPath.addCurveToPoint(CGPointMake(20.55, 8.42), controlPoint1: CGPointMake(19.13, 21), controlPoint2: CGPointMake(21.25, 13.45))
        bezierPath.addLineToPoint(CGPointMake(10.48, 8.42))
        bezierPath.addLineToPoint(CGPointMake(10.48, 8.42))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;

        fillColor.setFill()
        bezierPath.fill()
    }

    public class func drawPinterest() {
        //// Color Declarations
        let fillColor = UIColor(red: 0.043, green: 0.043, blue: 0.039, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(12, 0))
        bezierPath.addCurveToPoint(CGPointMake(0, 12), controlPoint1: CGPointMake(5.37, 0), controlPoint2: CGPointMake(0, 5.37))
        bezierPath.addCurveToPoint(CGPointMake(7.18, 22.99), controlPoint1: CGPointMake(0, 16.91), controlPoint2: CGPointMake(2.96, 21.14))
        bezierPath.addCurveToPoint(CGPointMake(7.39, 20.23), controlPoint1: CGPointMake(7.15, 22.15), controlPoint2: CGPointMake(7.18, 21.15))
        bezierPath.addCurveToPoint(CGPointMake(8.94, 13.7), controlPoint1: CGPointMake(7.62, 19.26), controlPoint2: CGPointMake(8.94, 13.7))
        bezierPath.addCurveToPoint(CGPointMake(8.55, 11.8), controlPoint1: CGPointMake(8.94, 13.7), controlPoint2: CGPointMake(8.55, 12.93))
        bezierPath.addCurveToPoint(CGPointMake(10.87, 8.69), controlPoint1: CGPointMake(8.55, 10.02), controlPoint2: CGPointMake(9.58, 8.69))
        bezierPath.addCurveToPoint(CGPointMake(12.49, 10.49), controlPoint1: CGPointMake(11.96, 8.69), controlPoint2: CGPointMake(12.49, 9.51))
        bezierPath.addCurveToPoint(CGPointMake(11.43, 14.75), controlPoint1: CGPointMake(12.49, 11.59), controlPoint2: CGPointMake(11.79, 13.23))
        bezierPath.addCurveToPoint(CGPointMake(13.32, 17.06), controlPoint1: CGPointMake(11.13, 16.03), controlPoint2: CGPointMake(12.06, 17.06))
        bezierPath.addCurveToPoint(CGPointMake(17.12, 10.68), controlPoint1: CGPointMake(15.59, 17.06), controlPoint2: CGPointMake(17.12, 14.14))
        bezierPath.addCurveToPoint(CGPointMake(12.13, 6.09), controlPoint1: CGPointMake(17.12, 8.05), controlPoint2: CGPointMake(15.35, 6.09))
        bezierPath.addCurveToPoint(CGPointMake(6.22, 11.83), controlPoint1: CGPointMake(8.49, 6.09), controlPoint2: CGPointMake(6.22, 8.8))
        bezierPath.addCurveToPoint(CGPointMake(7.01, 14.18), controlPoint1: CGPointMake(6.22, 12.88), controlPoint2: CGPointMake(6.53, 13.61))
        bezierPath.addCurveToPoint(CGPointMake(7.19, 14.85), controlPoint1: CGPointMake(7.24, 14.45), controlPoint2: CGPointMake(7.27, 14.55))
        bezierPath.addCurveToPoint(CGPointMake(6.94, 15.82), controlPoint1: CGPointMake(7.13, 15.07), controlPoint2: CGPointMake(7, 15.61))
        bezierPath.addCurveToPoint(CGPointMake(6.34, 16.12), controlPoint1: CGPointMake(6.86, 16.12), controlPoint2: CGPointMake(6.62, 16.23))
        bezierPath.addCurveToPoint(CGPointMake(3.88, 11.53), controlPoint1: CGPointMake(4.67, 15.43), controlPoint2: CGPointMake(3.88, 13.6))
        bezierPath.addCurveToPoint(CGPointMake(12.46, 4.03), controlPoint1: CGPointMake(3.88, 8.12), controlPoint2: CGPointMake(6.76, 4.03))
        bezierPath.addCurveToPoint(CGPointMake(20.06, 10.91), controlPoint1: CGPointMake(17.04, 4.03), controlPoint2: CGPointMake(20.06, 7.35))
        bezierPath.addCurveToPoint(CGPointMake(13.58, 19.13), controlPoint1: CGPointMake(20.06, 15.62), controlPoint2: CGPointMake(17.44, 19.13))
        bezierPath.addCurveToPoint(CGPointMake(10.65, 17.64), controlPoint1: CGPointMake(12.29, 19.13), controlPoint2: CGPointMake(11.07, 18.43))
        bezierPath.addCurveToPoint(CGPointMake(9.81, 20.94), controlPoint1: CGPointMake(10.65, 17.64), controlPoint2: CGPointMake(9.95, 20.4))
        bezierPath.addCurveToPoint(CGPointMake(8.6, 23.51), controlPoint1: CGPointMake(9.55, 21.86), controlPoint2: CGPointMake(9.06, 22.79))
        bezierPath.addCurveToPoint(CGPointMake(12, 24), controlPoint1: CGPointMake(9.68, 23.83), controlPoint2: CGPointMake(10.82, 24))
        bezierPath.addCurveToPoint(CGPointMake(24, 12), controlPoint1: CGPointMake(18.63, 24), controlPoint2: CGPointMake(24, 18.63))
        bezierPath.addCurveToPoint(CGPointMake(12, 0), controlPoint1: CGPointMake(24, 5.37), controlPoint2: CGPointMake(18.63, 0))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;

        fillColor.setFill()
        bezierPath.fill()
    }

    public class func drawTwitter() {
        //// Color Declarations
        let fillColor = UIColor(red: 0.043, green: 0.043, blue: 0.039, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(24, 2.37))
        bezierPath.addCurveToPoint(CGPointMake(21.17, 3.16), controlPoint1: CGPointMake(23.12, 2.77), controlPoint2: CGPointMake(22.17, 3.04))
        bezierPath.addCurveToPoint(CGPointMake(23.34, 0.37), controlPoint1: CGPointMake(22.19, 2.54), controlPoint2: CGPointMake(22.97, 1.55))
        bezierPath.addCurveToPoint(CGPointMake(20.21, 1.59), controlPoint1: CGPointMake(22.39, 0.95), controlPoint2: CGPointMake(21.33, 1.37))
        bezierPath.addCurveToPoint(CGPointMake(16.62, 0), controlPoint1: CGPointMake(19.31, 0.61), controlPoint2: CGPointMake(18.03, 0))
        bezierPath.addCurveToPoint(CGPointMake(11.69, 5.05), controlPoint1: CGPointMake(13.9, 0), controlPoint2: CGPointMake(11.69, 2.26))
        bezierPath.addCurveToPoint(CGPointMake(11.82, 6.2), controlPoint1: CGPointMake(11.69, 5.44), controlPoint2: CGPointMake(11.74, 5.83))
        bezierPath.addCurveToPoint(CGPointMake(1.67, 0.92), controlPoint1: CGPointMake(7.73, 5.99), controlPoint2: CGPointMake(4.1, 3.98))
        bezierPath.addCurveToPoint(CGPointMake(1, 3.46), controlPoint1: CGPointMake(1.25, 1.67), controlPoint2: CGPointMake(1, 2.54))
        bezierPath.addCurveToPoint(CGPointMake(3.19, 7.66), controlPoint1: CGPointMake(1, 5.21), controlPoint2: CGPointMake(1.87, 6.76))
        bezierPath.addCurveToPoint(CGPointMake(0.96, 7.04), controlPoint1: CGPointMake(2.39, 7.64), controlPoint2: CGPointMake(1.63, 7.41))
        bezierPath.addLineToPoint(CGPointMake(0.96, 7.1))
        bezierPath.addCurveToPoint(CGPointMake(4.91, 12.05), controlPoint1: CGPointMake(0.96, 9.54), controlPoint2: CGPointMake(2.66, 11.59))
        bezierPath.addCurveToPoint(CGPointMake(3.62, 12.23), controlPoint1: CGPointMake(4.5, 12.17), controlPoint2: CGPointMake(4.07, 12.23))
        bezierPath.addCurveToPoint(CGPointMake(2.69, 12.14), controlPoint1: CGPointMake(3.3, 12.23), controlPoint2: CGPointMake(2.99, 12.2))
        bezierPath.addCurveToPoint(CGPointMake(7.29, 15.64), controlPoint1: CGPointMake(3.32, 14.14), controlPoint2: CGPointMake(5.13, 15.6))
        bezierPath.addCurveToPoint(CGPointMake(1.17, 17.8), controlPoint1: CGPointMake(5.61, 17), controlPoint2: CGPointMake(3.48, 17.8))
        bezierPath.addCurveToPoint(CGPointMake(0, 17.73), controlPoint1: CGPointMake(0.78, 17.8), controlPoint2: CGPointMake(0.38, 17.78))
        bezierPath.addCurveToPoint(CGPointMake(7.55, 20), controlPoint1: CGPointMake(2.18, 19.16), controlPoint2: CGPointMake(4.77, 20))
        bezierPath.addCurveToPoint(CGPointMake(21.56, 5.64), controlPoint1: CGPointMake(16.61, 20), controlPoint2: CGPointMake(21.56, 12.31))
        bezierPath.addCurveToPoint(CGPointMake(21.54, 4.98), controlPoint1: CGPointMake(21.56, 5.42), controlPoint2: CGPointMake(21.55, 5.2))
        bezierPath.addCurveToPoint(CGPointMake(24, 2.37), controlPoint1: CGPointMake(22.51, 4.27), controlPoint2: CGPointMake(23.34, 3.38))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;

        fillColor.setFill()
        bezierPath.fill()
    }

    //// Generated Images

    public class var imageOfFacebook: UIImage {
        if Cache.imageOfFacebook != nil {
            return Cache.imageOfFacebook!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(24, 24), false, 0)
            WAPullToShareStyleKit.drawFacebook()

        Cache.imageOfFacebook = UIGraphicsGetImageFromCurrentImageContext().imageWithRenderingMode(.AlwaysTemplate)
        UIGraphicsEndImageContext()

        return Cache.imageOfFacebook!
    }

    public class var imageOfGooglePlus: UIImage {
        if Cache.imageOfGooglePlus != nil {
            return Cache.imageOfGooglePlus!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(33, 21), false, 0)
            WAPullToShareStyleKit.drawGooglePlus()

        Cache.imageOfGooglePlus = UIGraphicsGetImageFromCurrentImageContext().imageWithRenderingMode(.AlwaysTemplate)
        UIGraphicsEndImageContext()

        return Cache.imageOfGooglePlus!
    }

    public class var imageOfPinterest: UIImage {
        if Cache.imageOfPinterest != nil {
            return Cache.imageOfPinterest!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(24, 24), false, 0)
            WAPullToShareStyleKit.drawPinterest()

        Cache.imageOfPinterest = UIGraphicsGetImageFromCurrentImageContext().imageWithRenderingMode(.AlwaysTemplate)
        UIGraphicsEndImageContext()

        return Cache.imageOfPinterest!
    }

    public class var imageOfTwitter: UIImage {
        if Cache.imageOfTwitter != nil {
            return Cache.imageOfTwitter!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(24, 20), false, 0)
            WAPullToShareStyleKit.drawTwitter()

        Cache.imageOfTwitter = UIGraphicsGetImageFromCurrentImageContext().imageWithRenderingMode(.AlwaysTemplate)
        UIGraphicsEndImageContext()

        return Cache.imageOfTwitter!
    }

    //// Customization Infrastructure

    @IBOutlet var facebookTargets: [AnyObject]! {
        get { return Cache.facebookTargets }
        set {
            Cache.facebookTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: WAPullToShareStyleKit.imageOfFacebook)
            }
        }
    }

    @IBOutlet var googlePlusTargets: [AnyObject]! {
        get { return Cache.googlePlusTargets }
        set {
            Cache.googlePlusTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: WAPullToShareStyleKit.imageOfGooglePlus)
            }
        }
    }

    @IBOutlet var pinterestTargets: [AnyObject]! {
        get { return Cache.pinterestTargets }
        set {
            Cache.pinterestTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: WAPullToShareStyleKit.imageOfPinterest)
            }
        }
    }

    @IBOutlet var twitterTargets: [AnyObject]! {
        get { return Cache.twitterTargets }
        set {
            Cache.twitterTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: WAPullToShareStyleKit.imageOfTwitter)
            }
        }
    }

}
