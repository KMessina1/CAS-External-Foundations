/*-------------------------------------------------------------------------------------------------------------------------
     File: lib_Appearance.swift
   Author: Kevin Messina
  Created: 07/14/23
 Modified: 08/20/2026 04:56 PM EDT
  Version: 2
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------------------------------------------
    File: lib_Appearance.swift
  Author: Kevin Messina
 Created: 07/14/23
Modified: 07/14/2023
 
©2023-2026 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
 
2023_07_14  Changed Table setBackgroundColor to accept param as Color and convert to UIColor in function.
 
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import UIKit
import SwiftUI

// MARK: - *** APPEARANCE CONFIGURATIONS ***
public struct AppearanceConfiguration {
    public init() {}

    public struct Alert {
        public init() {}

        public func setColors(tintColor:UIColor,backgroundColor:UIColor? = nil) {
            let appearance = UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self])
            appearance.tintColor = tintColor
            
            if (backgroundColor != nil) {
                appearance.backgroundColor = backgroundColor
            }
        }
    }
    
    public struct DatePicker {
        public init() {}

        public func setTextColor(_ titleColor:UIColor) {
            UIDatePicker.appearance().tintColor = titleColor
        }
    }
    
    public struct NavigationView {
        public init() {}

        public func setNavigationViewTitleColor(_ titleColor:UIColor) {
            let appearance = UINavigationBar.appearance()
            appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
            appearance.titleTextAttributes = [.foregroundColor: titleColor]
        }
        
        public func setNavigationViewBackgroundColor(_ backgroundColor:UIColor) {
            let appearance = UINavigationBar.appearance()
            appearance.backgroundColor = backgroundColor
            appearance.isOpaque = false
        }
    }
    
    public struct ScrollView {
        public init() {}

        public func setHandleColor(_ indicatorStyle:UIScrollView.IndicatorStyle) {
            UIScrollView.appearance().indicatorStyle = indicatorStyle
        }
        
        public func setBackgroundColor(_ backgroundColor:Color) {
            let appearance = UIScrollView.appearance()
            appearance.backgroundColor = UIColor(backgroundColor)
            appearance.isOpaque = false
        }
    }
    
    public struct SegmentedControl {
        public init() {}

        public func setWidthByContent(on:Bool) {
            let appearance = UISegmentedControl.appearance()
            appearance.apportionsSegmentWidthsByContent = true
        }
        
        public func setColors(background:UIColor,selectedBackground:UIColor,text:UIColor,selectedText:UIColor) {
            let appearance = UISegmentedControl.appearance()
            appearance.selectedSegmentTintColor = selectedBackground
            appearance.backgroundColor = background
            appearance.setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: deviceIs.Pad ? .headline : .body)], for: .normal)
            appearance.setTitleTextAttributes([.foregroundColor : selectedText], for: .selected)
            appearance.setTitleTextAttributes([.foregroundColor : text], for: .normal)
        }
    }
    
    public struct Stepper {
        public init() {}

        public func setPlusMinusSigns() {
            UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
            UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
        }
    }
    
    public struct TabBar {
        public init() {}

        public func setColors(unSelected:Color,badge:Color = .red) {
            UITabBar.appearance().unselectedItemTintColor = UIColor(unSelected)
            UITabBarItem.appearance().badgeColor = UIColor(badge)
        }
    }
    
    public struct Table {
        public init() {}

        public func setCellSelectionStyle(_ style:UITableViewCell.SelectionStyle) {
            let cellAppearance = UITableViewCell.appearance()
            cellAppearance.selectionStyle = style
        }
        
        public func setCellBackgroundColor(_ color:Color) {
            let cellAppearance = UITableViewCell.appearance()
            cellAppearance.backgroundColor = UIColor(color)
        }
        
        public func setSeparatorStyle(_ style:UITableViewCell.SeparatorStyle,color:Color) {
            let appearance = UITableView.appearance()
            appearance.separatorStyle = style
            appearance.separatorColor = UIColor(color)
            appearance.separatorInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        }
        
        public func setAccessoryType(_ type:UITableViewCell.AccessoryType) {
            let cellAppearance = UITableViewCell.appearance()
            cellAppearance.accessoryType = type
        }
        
        public func setBackgroundColor(_ backgroundColor:UIColor) {
            let appearance = UITableView.appearance()
            appearance.backgroundColor = backgroundColor
            appearance.isOpaque = false
            
            let cellAppearance = UITableViewCell.appearance()
            cellAppearance.backgroundColor = backgroundColor
        }
        
        public func setHeaderViewToNil() {
            let appearance = UITableView.appearance()
            appearance.tableHeaderView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            appearance.sectionFooterHeight = .zero
        }
        
        public func setFooterViewToNil() {
            let appearance = UITableView.appearance()
            appearance.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            appearance.sectionFooterHeight = .zero
        }
    }
    
    public struct textField {
        public init() {}

        public func setClearButton_Off() {
            let appearance = UITextField.appearance()
            appearance.clearButtonMode = .never
        }
        public func setClearButton_ON() {
            let appearance = UITextField.appearance()
            appearance.clearButtonMode = .always
        }
    }
    
    public struct toggle {
        public init() {}

        public func setTintColor(_ tintColor: Color) {
            let appearance = UISwitch.appearance()
            appearance.tintColor = UIColor(tintColor)
        }
        
        public func setOnColor(_ onColor: Color) {
            let appearance = UISwitch.appearance()
            appearance.onTintColor = UIColor(onColor)
        }
    }
    
    public struct Slider {
        public init() {}

        public func setDisabledThumb(_ tintColor: Color) {
            let appearance = UISlider.appearance()
            appearance.setThumbImage(
                UIImage(systemName: "circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .disabled
            )
        }
    }
}
