/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_UIScreen.swift
   Author: Kevin Messina
  Created: 1/25/21
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/


import Foundation
import UIKit

public extension UIScreen{
    static var current: UIScreen? {
        UIWindow.current?.screen
    }

    var width: CGFloat { (UIScreen.current != nil) ?UIScreen.current!.bounds.size.width :0 }
    var height: CGFloat { (UIScreen.current != nil) ?UIScreen.current!.bounds.size.height :0 }
    var size: CGSize { (UIScreen.current != nil) ?UIScreen.current!.bounds.size :CGSizeMake(0,0) }
    var isZoomed: Bool { (UIScreen.current != nil) ?UIScreen.current!.scale > UIScreen.current!.nativeScale :false }
}
