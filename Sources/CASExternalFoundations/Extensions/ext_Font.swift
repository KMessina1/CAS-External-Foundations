/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Font.swift
   Author: Kevin Messina
  Created: 05/28/2025
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI

public extension Font {
    static func fraction(_ style: UIFont.TextStyle) -> Font {
        let preferredFont = UIFont.preferredFont(forTextStyle: style)
        let size = preferredFont.pointSize
        return Font(UIFont.fractionFont(ofSize: size) as CTFont)
    }
}

