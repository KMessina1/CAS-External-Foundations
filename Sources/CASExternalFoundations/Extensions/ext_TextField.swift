/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_TextField.swift
   Author: Kevin Messina
  Created: 10/29/25
 Modified: 08/20/2026 04:56 PM EDT
  Version: 2
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import SwiftUI
import UIKit

public struct TextField_noAccessoryView: UIViewRepresentable {
    @Binding  public var text: String
    public var placeholder: String

    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.inputAccessoryView = nil
        textField.returnKeyType = .done

        return textField
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        public var parent: TextField_noAccessoryView
        
        public init(_ parent: TextField_noAccessoryView) {
            self.parent = parent
        }
        
        public func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        
        // Optional: Dismiss keyboard when return key is pressed
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
