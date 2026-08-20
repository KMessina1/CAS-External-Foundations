/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_View.swift
   Author: Kevin Messina
  Created: 3/23/24
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_View.swift
  Author: Kevin Messina
 Created: 3/23/24
Modified:
 
©2024-2026 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
 
2024_07_29: Added Border functions
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI

public extension View {
    /// Hides the view based on a boolean value without using opacity.
    /// This maintains the view's space in the layout.
    @ViewBuilder
    func hide(_ shouldHide: Bool) -> some View {
        if shouldHide {
            EmptyView()
        } else {
            self
        }
    }
    
    @ViewBuilder
    func conditionalSearchable(if condition: Bool, text: Binding<String>, prompt: String) -> some View {
        if condition {
            self.searchable(text: text, prompt: prompt)
        } else {
            self
        }
    }
    
    // MARK: - *** Conditional Modifiers and Conditions ***

    /// Usage: .if(showOverlay){
    ///            $0.overlay(Circle().foregroundColor(.red))
    ///        }
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
    
    // MARK: - *** KEYBOARD ***
    func limitText(_ text: Binding<String>, to characterLimit: Int) -> some View {
        self
            .onChange(of: text.wrappedValue) {
                if characterLimit > 0 {
                    text.wrappedValue = String(text.wrappedValue.prefix(characterLimit))
                }
            }
    }
    
    func numericOnly(_ text: Binding<String>) -> some View {
        self
            .onChange(of: text.wrappedValue) {
                text.wrappedValue = String(text.wrappedValue.filter { "0123456789".contains($0) })
            }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil, for: nil)
    }
    
    // MARK: - *** VIEW BORDERS ***
    /// Add a COLORED BORDER to any view
    ///
    /// - Usage:
    ///   Text("Hello World").addBorder(Color.blue, width: 3, cornerRadius: 5)
    ///
    /// - Parameters:
    ///   - color: Color of border
    ///   - width: line width of border
    ///   - cornerRadius: Rounding of border corner
    ///
    /// - Returns: Bordered outline for view.
    func addBorder<S>(
        color: S,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 8.0
    ) -> some View where S :ShapeStyle {
        return overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.clear)
                .strokeBorder(color, lineWidth: width)
        )
    }
    
    /// Add a COLORED BACKGROUND to any view
    /// - Parameters:
    ///   - color: Color of background
    ///   - opacity: Opacity Level
    ///   - cornerRadius: Rounding of border corner
    ///   - pad: Padding
    /// - Returns: Colored background for view.
    func addBackground<S>(
        color: S,
        opacity: CGFloat = 0.10,
        cornerRadius: CGFloat = 8.0,
        pad: CGFloat = 10.0
    ) -> some View where S: ShapeStyle {
        return padding(.all,pad).background(color.opacity(opacity)).cornerRadius(cornerRadius)
    }

    /// Add a BORDERED GRADIENT BACKGROUND to any view
    /// - Parameters:
    ///   - backColor: Color of background
    ///   - borderColor: Color of background
    ///   - pad: Padding
    /// - Returns: Gradient background for view.
    func addBorderedGradientBackground<S>(
        backColor: S,
        borderColor: Color,
        pad: CGFloat = 10.0
    ) -> some View where S: ShapeStyle {
        return padding(.all,pad)
            .background(gradientBackground(color: backColor as! Color))
            .addBorder(color: borderColor,width: 2.0)
    }

    /// Add a GRADIENT BACKGROUND to any view
    /// - Parameters:
    ///   - pad: Padding
    /// - Returns: Gradient background for view.
    func addGradientBackground<S>(
        color: S,
        pad: CGFloat = 10.0
    ) -> some View where S: ShapeStyle {
        return padding(.all,pad).background(gradientBackground(color: color as! Color))
    }
    
    @ViewBuilder
    private func gradientBackground(color: Color) -> some View {
        LinearGradient(
            gradient: Gradient(colors: [color, color, .black]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
