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

