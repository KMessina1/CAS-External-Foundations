/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_CGPoint.swift
   Author: Kevin Messina
  Created: 5/20/26
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI

extension CGPoint: @retroactive RawRepresentable {
    public typealias RawValue = String

    // Convert from String to CGPoint
    public init?(rawValue: String) {
        let point = NSCoder.cgPoint(for: rawValue)
        if point == .zero && !rawValue.contains("0") {
            return nil
        }
        self = point
    }

    // Convert from CGPoint to String
    public var rawValue: String {
        NSCoder.string(for: self)
    }
}
