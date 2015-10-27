//
//  ViewController.swift
//  ITPullToShareExample
//
//  Created by Wendy Abrantes on 25/10/2015.
//  Copyright © 2015 Wendy Abrantes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shareScrollView = WAPullToShareScrollView()
    let shape = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //add buttons
        shareScrollView.addShareIcons([
            WAPullToShareButtonType.facebook,
            WAPullToShareButtonType.twitter,
            WAPullToShareButtonType.pinterest,
            WAPullToShareButtonType.googlePlus ])
        
        //selection callback
        shareScrollView.buttonSelectedCallback = { (sender, senderType) -> Void in

            if senderType == WAPullToShareButtonType.facebook {
                NSLog("facebook button selected")
            }
        }
        
        shareScrollView.containerBackgroundColor = UIColor.blueColor()
        shareScrollView.circleSelectionColor = UIColor.blackColor()
        
        view.addSubview(shareScrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        shareScrollView.frame = CGRect(
            x:0,
            y:0,
            width: view.bounds.width,
            height:view.bounds.height)
                

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

