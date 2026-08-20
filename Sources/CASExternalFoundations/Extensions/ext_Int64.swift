/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Int64.swift
   Author: Kevin Messina
  Created: 12/3/25
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

//--------------------------------------------------------------------------------------------------------------------------
//     File: ext_Int64.swift
//   Author: Kevin Messina
//  Created: 12/3/25
// Modified:
// 
// ©2025 Creative App Solutions, LLC. - All Rights Reserved.
//--------------------------------------------------------------------------------------------------------------------------
// NOTES:
//--------------------------------------------------------------------------------------------------------------------------

import Foundation

public extension Int64 {
    var isInvalidDbId: Bool { (self == -1) ?true :false }
    
    var isValidDbId: Bool { (self != -1) ?true :false }
    
    var orInvalidDbId: Int64 { (self > 0) ? self : -1 }

    var orInvalidDbIdInteger: Int { (self > 0) ? Int(self) : -1 }

    var asString: String { "\(self)" }
    
    var dashesIfInvalidDbId: String { (self == 0) ?dashesTxt :"\(self)" }
}

