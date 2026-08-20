/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_UIFont.swift
   Author: Kevin Messina
  Created: 5/2/26
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import UIKit

public extension UIFont {
    static func fractionFont(ofSize pointSize: CGFloat) -> UIFont {
        let systemFontDesc = UIFont.systemFont(ofSize: pointSize).fontDescriptor
        let featureSettings: [UIFontDescriptor.FeatureKey: Int] = [
            .type: kFractionsType,
            .selector: kDiagonalFractionsSelector,
        ]
        let attributes = [
            UIFontDescriptor.AttributeName.featureSettings: [
                featureSettings
            ]
        ]
        let fractionFontDesc = systemFontDesc.addingAttributes(attributes)
        return UIFont(descriptor: fractionFontDesc, size: pointSize)
    }

    static func condensedBold(ofSize size: CGFloat) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: .bold)
        let descriptor = systemFont.fontDescriptor.addingAttributes([
            UIFontDescriptor.AttributeName.traits: [
                UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold,
                UIFontDescriptor.TraitKey.width: -0.5
            ]
        ])
        return UIFont(descriptor: descriptor, size: size)
    }

    static func condensed(ofSize size: CGFloat) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: .bold)
        let descriptor = systemFont.fontDescriptor.addingAttributes([
            UIFontDescriptor.AttributeName.traits: [
                UIFontDescriptor.TraitKey.width: -0.4
            ]
        ])
        return UIFont(descriptor: descriptor, size: size)
    }
}

