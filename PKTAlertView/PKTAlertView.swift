//
//  ActivityPopupView.swift
//  Wishfeeds
//
//  Created by Pankaj Teckchandani on 09/03/17.
//  Copyright © 2017 wishfeeds. All rights reserved.
//

import UIKit

class PKTAlertView: UIView {
    var onCancelClick: (() -> Void)?
    var onOkayClick: (() -> Void)?
    var onCompletion: (() -> Void)?
    
    
    @IBOutlet weak var labelForTitle: UILabel!
    private var blackView : UIView?
   
    
    private var PRIMARY_COLOR = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1)
    private var SECONDARY_COLOR = UIColor(red: 96.0/255.0, green: 125.0/255.0, blue: 139.0/255.0, alpha: 1)
        private(set) var alertIcon : UIImage!
    
    @IBOutlet weak var imageviewForIcon: UIImageView!
    @IBOutlet weak var labelForExclamation: UILabel!
    @IBOutlet private  weak var viewForBar: UIView!
    @IBOutlet private weak var circleView: UIView!
    @IBOutlet private weak var buttonSuccess: UIButton!
    @IBOutlet private weak var buttonCancel: UIButton!
    @IBOutlet private weak var labelForMessage: UILabel!

    @IBOutlet private weak var cancelButtonHeightConstraint: NSLayoutConstraint!
    
    init() {
        super.init(frame: CGRectMake(UIScreen.mainScreen().bounds.origin.x+16, UIScreen.mainScreen().bounds.origin.y, UIScreen.mainScreen().bounds.size.width-32, 0));
        
        return;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    func setIconForALertView(image : UIImage) -> Void {
        self.imageviewForIcon.image = image;
    }

    func showPopup(onCompletion:(() -> Void),onCancelClick:(() -> Void),onOkayClick:(() -> Void)){
        
        self.onCancelClick = onCancelClick;
        self.onOkayClick = onOkayClick;
        self.onCompletion = onCompletion;
        
        viewForBar.backgroundColor = PRIMARY_COLOR;
        buttonSuccess.backgroundColor = SECONDARY_COLOR;
        
        self.circleView.layer.borderWidth = 4.0
        self.circleView.layer.borderColor = PRIMARY_COLOR.CGColor
        
        if(blackView == nil)
        {
            self.blackView = UIView(frame :  (UIApplication.sharedApplication().keyWindow?.bounds)!);
            self.blackView!.backgroundColor = UIColor.blackColor();
            self.blackView!.alpha = 0.5;//Default
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
            
            self.blackView!.addGestureRecognizer(tap);
            
        }
        
        if(self.alertIcon == nil){
            self.imageviewForIcon.hidden = true;
            self.labelForExclamation.hidden = false;
            self.labelForExclamation.textColor = PRIMARY_COLOR;
        }
        else{
            self.imageviewForIcon.hidden = false;
            self.labelForExclamation.hidden = true;
        }
        
        
        self.buttonSuccess.layer.cornerRadius = self.buttonSuccess.frame.size.height/2;
        
        let screenRect = UIScreen.mainScreen().bounds
        let screenWidth = screenRect.size.width;
        let screenHeight = screenRect.size.height;
        self.center = CGPointMake(screenWidth/2, screenHeight/2);
        
        dispatch_async(dispatch_get_main_queue()) {
            self.alpha = 0;
            
            let mainRect = UIScreen.mainScreen().bounds
        
            self.frame = CGRectMake(mainRect.origin.x + 16, self.frame.origin.y, mainRect.size.width-32, self.frame.size.height)
          
            
            self.autoresizingMask = [.FlexibleHeight]
            self.sizeToFit()
            
            
            UIApplication.sharedApplication().keyWindow?.addSubview(self.blackView!)
            UIApplication.sharedApplication().keyWindow?.addSubview(self);
            self.fadeIn(onCompletion: {
                
            });
        }
    }
    
    func show() {
        
        self.circleView.layer.borderWidth = 2.0
        self.circleView.layer.borderColor = PRIMARY_COLOR.CGColor
        
        if(blackView == nil)
        {
            self.blackView = UIView(frame :  (UIApplication.sharedApplication().keyWindow?.bounds)!);
            self.blackView!.backgroundColor = UIColor.blackColor();
            self.blackView!.alpha = 0.3;//Default
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
            
            self.blackView!.addGestureRecognizer(tap);
            
        }
        
        self.buttonSuccess.layer.cornerRadius = self.buttonSuccess.frame.size.height/2;
        
        let screenRect = UIScreen.mainScreen().bounds
        let screenWidth = screenRect.size.width;
        let screenHeight = screenRect.size.height;
        self.center = CGPointMake(screenWidth/2, screenHeight/2);
        
        dispatch_async(dispatch_get_main_queue()) {
            self.alpha = 0;
            UIApplication.sharedApplication().keyWindow?.addSubview(self.blackView!)
            UIApplication.sharedApplication().keyWindow?.addSubview(self);
            self.fadeInEaseIn(onCompletion: {
                
            });
        
        }
        
    }
    func dismiss() -> Void {
        
        self.blackView!.removeFromSuperview();
 
        self.fadeOut { 
            self.removeFromSuperview();
        }
    }
    
    @IBAction func okayButtonClick(sender: AnyObject) {
        
        // Callback
        if let callback = self.onOkayClick {
            callback ()
        }
        
    }
    @IBAction func cancelButtonClick(sender: AnyObject) {
        
        // Callback
        if let callback = self.onCancelClick {
            callback ()
        }
    }
    
    func setBackColor(color: UIColor) -> Void {
        if(blackView == nil)
        {
            self.blackView = UIView(frame :  (UIApplication.sharedApplication().keyWindow?.bounds)!);
            self.blackView!.alpha = 0.3;//Default
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
            self.blackView!.addGestureRecognizer(tap);
        }
        self.blackView!.backgroundColor = color
    }
    func setBackViewAlpha(value: CGFloat)->Void{
        if(blackView == nil)
        {
            self.blackView = UIView(frame :  (UIApplication.sharedApplication().keyWindow?.bounds)!);
            self.blackView!.backgroundColor = UIColor.blackColor()
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
            self.blackView!.addGestureRecognizer(tap);
        }
        
        self.blackView!.alpha = value;
    }
    @IBAction func dismissView(sender: AnyObject) {
        self.dismiss();
    }
    
}


extension UIView {
    
    
    
    func fadeInEaseIn( duration: NSTimeInterval = 0.15,onCompletion:()->Void) {
        
        UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
        }) { (finished) in
            onCompletion();
        }
        
        
        UIView.animateWithDuration(duration, animations: {
            
        }) { (flag) in
            
        }
        
    }
    
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    
    
    func fadeIn( duration: NSTimeInterval = 0.25,onCompletion:()->Void) {
        
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1.0
        }) { (flag) in
            onCompletion();
        }
        
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut( duration: NSTimeInterval = 0.15,onCompletion:()->Void) {
        
        UIView.animateWithDuration(duration, animations: { 
                self.alpha = 0.0
            }) { (flag) in
                onCompletion();
        }
  
    }
    
}