//
//  ZPrint.swift
//  Pixcial
//
//  Created by lzackx on 2017/11/4.
//  Copyright © 2017年 lzackx. All rights reserved.
//

import Foundation

extension NSObject {
    
    public func zprint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
            let date = Date()
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "yyy-MM-dd HH:mm:ss.SSS"
            let now = timeFormatter.string(from: date) as String
            print("[\(now)", "\(NSStringFromClass(self.classForCoder))]:", terminator: "")
            for item in items {
                print(separator, terminator: "")
                print(item, terminator: "")
            }
            print(terminator: terminator)
        #endif
    }
    
}
