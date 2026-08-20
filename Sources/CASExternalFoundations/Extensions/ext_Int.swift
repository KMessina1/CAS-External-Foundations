/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Int.swift
   Author: Kevin Messina
  Created: 6/2/24
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation

public extension Int {
    var boolValue: Bool { (self == 1) ?true :false }
    var isZero: Bool { (self == 0) ?true :false }
    var dbValue: Int64 { Int64(self) }
    var dashesIfZero: String { self.isZero ?dashesTxt :self.asNum() }
    
    func asNum(negPrefix:String?="-",negSuffix:String?="",dashesIfZero: Bool = false) -> String {
        let formatter:NumberFormatter! = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = Locale.current.groupingSeparator ?? ","
        formatter.maximumFractionDigits = 0
        formatter.negativePrefix = negPrefix!
        formatter.negativeSuffix = negSuffix!
        
        
        let formattedNumber = formatter.string(from: NSNumber(value: self)) ?? dashesTxt
        if dashesIfZero && (formattedNumber == "0" || formattedNumber == "-0") {
            return dashesTxt
        }else{
            return formattedNumber
        }
    }
    
    func roundUpToNearest(multipleOf m: Int) -> Int {
        let doubleValue = Double(self)
        let multiple: Double = Double(m)
        let roundedUpValue = ceil(doubleValue / multiple) * multiple
        return Int(roundedUpValue)
    }
    
    func roundedToNearest(multipleOf m: Int) -> Int {
        let doubleValue = Double(self)
        let doubleMultiple = Double(m)
        let roundedValue = (doubleValue / doubleMultiple).rounded() * doubleMultiple
        return Int(roundedValue)
    }
    
    var formatThousandsAsK: String {
        let absoluteValue = abs(Double(self))
        let sign = self < 0 ? "-" : ""
        
        if absoluteValue >= 1000 {
            let kValue = absoluteValue / 1000.0
            
            let formatter = NumberFormatter()
            // Returns "1" instead of "1.0"
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 1
            formatter.numberStyle = .decimal
            
            let formattedNumber = formatter.string(from: NSNumber(value: kValue)) ?? ""
            return "\(sign)\(formattedNumber)k"
        } else {
            return "\(self)"
        }
    }
}

