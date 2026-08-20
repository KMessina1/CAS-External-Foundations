/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Bundle.swift
   Author: Kevin Messina
  Created: 09/05/2024
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation

public extension Bundle {
    /// Text("\( Bundle.main.version().release )")
    /// Text("\( Bundle.main.version().build )")
    /// Text("\( Bundle.main.version().formatted(.v) )")
    struct version {
        public enum versionPrefix { case none,v,version }
        public enum versionSuffix { case none,period,parens,build }

        public var release: String {
            return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "n/a"
        }
        
        public var build: String {
            return (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? "n/a"
        }
        
        public func formatted(prefix:versionPrefix, suffix:versionSuffix) -> String {
            var prefixTxt: String = ""
            var suffixTxt: String = ""

            switch prefix {
                case .none: prefixTxt = ""
                case .v: prefixTxt = "v"
                case .version: prefixTxt = "Version "
            }

            switch suffix {
                case .none: suffixTxt = ""
                case .period: suffixTxt = ".\(build)"
                case .parens: suffixTxt = " (\(build))"
                case .build: suffixTxt = "build: \(build)"
            }

            return "\(prefixTxt)\(release)\(suffixTxt)"
        }
    }
}
