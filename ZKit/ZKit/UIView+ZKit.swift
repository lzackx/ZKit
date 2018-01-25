//
//  UIView+ZExtension.swift
//
//  Created by Zack on 26/5/16.
//  Copyright © 2016年 lZackx. All rights reserved.
//

import UIKit

extension UIView {
    
    public var zX: CGFloat {
        get {
            return self.frame.origin.x;
        }
        set {
            var frame: CGRect = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
    }
    
    public var zY: CGFloat {
        get {
            return self.frame.origin.y;
        }
        set {
            var frame: CGRect = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
    }
    
    public var zCenterX: CGFloat {
        get {
            return self.center.x;
        }
        set {
            var center: CGPoint = self.center;
            center.x = newValue;
            self.center = center;
        }
    }
    
    public var zCenterY: CGFloat {
        get {
            return self.center.y;
        }
        set {
            var center: CGPoint = self.center;
            center.y = newValue;
            self.center = center;
        }
    }
    
    public var zWidth: CGFloat {
        get {
            return self.frame.size.width;
        }
        set {
            var frame: CGRect = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
    }
    
    public var zHeight: CGFloat {
        get {
            return self.frame.size.height;
        }
        set {
            var frame: CGRect = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
    }
    
    public var zSize: CGSize {
        get {
            return self.frame.size;
        }
        set {
            var frame: CGRect = self.frame;
            frame.size = newValue;
            self.frame = frame;
        }
    }
    
    public var zOrigin: CGPoint {
        get {
            return self.frame.origin;
        }
        set {
            var frame: CGRect = self.frame;
            frame.origin = newValue;
            self.frame = frame;
        }
    }
    
}

extension UIView {
    
    public func vibrancyView(with style: UIBlurEffectStyle, contentView: UIView? = nil) -> UIView {
        
        guard let contentView = contentView else {
            return blurView(with: style)
        }
        // Init blur effect with style
        let blurEffect = UIBlurEffect(style: style)
        // Init blur effect view
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        // Init vibrancy effect view
        let vibrancyEffectView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        vibrancyEffectView.frame = blurEffectView.bounds
        // combine each view
        vibrancyEffectView.contentView.addSubview(contentView)
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        // return duplicated self with combined view from above
        addSubview(blurEffectView)
        return self
    }
    
    public func blurView(with style: UIBlurEffectStyle) -> UIView {
        
        let blurEffect = UIBlurEffect(style: style)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = bounds
        addSubview(effectView)
        return self
    }
}

extension UIView {
    
    public func duplicate(view: UIView) -> UIView {
        
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: view)
        let duplicateView = NSKeyedUnarchiver.unarchiveObject(with: archiveData) as! UIView
        return duplicateView
    }
    
}

extension UIView {
    
    static var zBlurable = "zBlurable"
    
    var zIsBlurred: Bool {
        return objc_getAssociatedObject(self, &UIView.zBlurable) is UIImageView
    }
    
    func zBlur(blurRadius: CGFloat) {
        
        if self.superview == nil {
            return
        }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, 1)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        guard let blur = CIFilter(name: "CIGaussianBlur") else {
            return
        }
        blur.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        blur.setValue(blurRadius, forKey: kCIInputRadiusKey)
        let ciContext  = CIContext(options: nil)
        let result = blur.value(forKey: kCIOutputImageKey) as! CIImage
        let boundingRect = CGRect(x:0, y: 0, width: frame.width, height: frame.height)
        let cgImage = ciContext.createCGImage(result, from: boundingRect)!
        let filteredImage = UIImage(cgImage: cgImage)
        let blurOverlay = UIImageView()
        blurOverlay.frame = boundingRect
        blurOverlay.image = filteredImage
        blurOverlay.contentMode = UIViewContentMode.left
        if #available(iOS 9.0, *) {
            if let superview = superview as? UIStackView,
                let index = (superview as UIStackView).arrangedSubviews.index(of: self) {
                removeFromSuperview()
                superview.insertArrangedSubview(blurOverlay, at: index)
            } else {
                blurOverlay.frame.origin = frame.origin
                UIView.transition(from: self,
                                  to: blurOverlay,
                                  duration: 0.2,
                                  options: UIViewAnimationOptions.curveEaseIn,
                                  completion: nil)
            }
        } else {
            // Fallback on earlier versions
            blurOverlay.frame.origin = frame.origin
            UIView.transition(from: self,
                              to: blurOverlay,
                              duration: 0.2,
                              options: UIViewAnimationOptions.curveEaseIn,
                              completion: nil)
        }
        objc_setAssociatedObject(self,
                                 &UIView.zBlurable,
                                 blurOverlay,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    func zUnBlur() {
        
        guard let blurOverlay = objc_getAssociatedObject(self, &UIView.zBlurable) as? UIImageView else {
            return
        }
        if #available(iOS 9.0, *) {
            if let superview = blurOverlay.superview as? UIStackView,
                let index = (blurOverlay.superview as! UIStackView).arrangedSubviews.index(of: blurOverlay) {
                blurOverlay.removeFromSuperview()
                superview.insertArrangedSubview(self, at: index)
            } else {
                self.frame.origin = blurOverlay.frame.origin
                UIView.transition(from: blurOverlay,
                                  to: self,
                                  duration: 0.2,
                                  options: UIViewAnimationOptions.curveEaseIn,
                                  completion: nil)
            }
        } else {
            // Fallback on earlier versions
            self.frame.origin = blurOverlay.frame.origin
            UIView.transition(from: blurOverlay,
                              to: self,
                              duration: 0.2,
                              options: UIViewAnimationOptions.curveEaseIn,
                              completion: nil)
        }
        objc_setAssociatedObject(self,
                                 &UIView.zBlurable,
                                 nil,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}









