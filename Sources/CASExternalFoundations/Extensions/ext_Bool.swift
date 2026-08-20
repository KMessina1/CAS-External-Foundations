/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Bool.swift
   Author: Kevin Messina
  Created: 2/9/21
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

//--------------------------------------------------------------------------------------------------------------------------
//     File: ext_Bool.swift
//   Author: Kevin Messina
//  Created: 2/9/21
// Modified:
// 
// ©2021-2026 Creative App Solutions, LLC. - All Rights Reserved.
//--------------------------------------------------------------------------------------------------------------------------
// NOTES:
//--------------------------------------------------------------------------------------------------------------------------

import Foundation

public extension Bool {
    mutating func negate() { self = false }
    
    var intValue: Int {
        if self == false {
            return 0
        }else{
            return 1
        }
    }
    
    var stringValue:String { self == true ? "True" : "False" }
    
    var asYesNo:String { self == true ? "Yes" : "No" }
   
    var asTrueFalse:String { self == true ? "True" : "False" }

    init(_ number: Int) { self.init(truncating: number as NSNumber) }
}

