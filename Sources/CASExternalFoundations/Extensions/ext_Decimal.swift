/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Decimal.swift
   Author: Kevin Messina
  Created: Jan 5, 2020
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI

// MARK: - *** DECIMAL ***
public extension Decimal {
    func numberOfFractionalDigits() -> Int {
        // Convert the Decimal to a string representation.
        let stringRepresentation = self.description
        
        // Find the range of the decimal separator.
        if let decimalSeparatorRange = stringRepresentation.range(of: ".") {
            // Calculate the number of digits after the decimal separator.
            // Subtract 1 for the decimal separator itself.
            return stringRepresentation.distance(from: decimalSeparatorRange.upperBound, to: stringRepresentation.endIndex)
        } else {
            // If no decimal separator is found, there are no fractional digits.
            return 0
        }
    }
}



