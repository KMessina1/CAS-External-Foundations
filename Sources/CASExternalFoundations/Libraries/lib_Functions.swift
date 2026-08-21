/*-------------------------------------------------------------------------------------------------------------------------
     File: lib_Functions.swift
   Author: Kevin Messina
  Created: 6/21/23
 Modified: 08/20/2026 07:36 PM EDT
  Version: 2
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import Swift
import SwiftUI

// MARK: Filter Characters and limit length
/// filterTextAndLimitLength
/// - Parameters:
///   - text: String to be processed.
///   - chars: Acceptable characters in resultant string.
///   - length: if > 0, then limits length. Enter 0 for unlimited.
/// - Returns: string filtered by chars parameter and limited in length if length parameter > 0
public func filterTextAndLimitLength(_ text:String, chars:String, length: Int) -> String {
    var newText = text.filter(chars.contains) // Filter allowable characters in set
    
    if length > 0 { //Limit num chars
        newText = String(newText.prefix(length))
    }
    
    return newText
}

public func limitValue(oldValue:Double, newValue:Double, maxValue: Double) -> Double {
    return (newValue > maxValue) ?oldValue :newValue
}

public func imgHasAFilledVersionOrNot(_ systemName: String) -> Image {
    if UIImage(systemName: "\(systemName).fill") != nil {
        return Image(systemName: "\(systemName).fill").symbolRenderingMode(.multicolor)
    }else{
        return Image(systemName: systemName).symbolRenderingMode(.multicolor)
        
    }
}
