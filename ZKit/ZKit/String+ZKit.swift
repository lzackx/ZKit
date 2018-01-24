//
//  String+ZKit.swift
//  ZKit
//
//  Created by lzackx on 2018/1/24.
//  Copyright © 2018年 lZackx. All rights reserved.
//

import Foundation

extension String {
    
    public func zLocalizedStringOfMainBundlePlistTable() -> String {
        
        return zLocalizedString(value: self, comment: self)
    }
    
    public func zLocalizedString(tableName: String? = "InfoPlist", bundle: Bundle = Bundle.main, value: String, comment: String) -> String {
    
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
}
