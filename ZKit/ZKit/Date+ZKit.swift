//
//  Date+ZKit.swift
//  ZKit
//
//  Created by lzackx on 2018/1/23.
//  Copyright © 2018年 lZackx. All rights reserved.
//

import Foundation

extension Date {
    
    public func zeroDate() -> Date {
        
        let calendar: Calendar = Calendar.current
        let components: Set<Calendar.Component> = [.year,
                                                   .month,
                                                   .day,
                                                   .hour,
                                                   .minute,
                                                   .second]
        var dateComponents = calendar.dateComponents(components, from: self)
        let zone = TimeZone.current
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = zone.secondsFromGMT()
        
        let zeroDate = calendar.date(from: dateComponents)!
        
        return zeroDate
    }
    
    public func zoneDate() -> Date {
        
        let calendar: Calendar = Calendar.current
        let components: Set<Calendar.Component> = [.year,
                                                   .month,
                                                   .day,
                                                   .hour,
                                                   .minute,
                                                   .second]
        var dateComponents = calendar.dateComponents(components, from: self)
        let zone = TimeZone.current
        dateComponents.second = zone.secondsFromGMT()
        
        let zoneDate = calendar.date(from: dateComponents)!
        
        return zoneDate
    }
}
