/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_Array.swift
   Author: Kevin Messina
  Created: 3/22/25
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation

public extension Array {
    func returnUniqueEntriesFromArray(_ arr:[String]) -> [String] {
        var newArray:[String] = []
        
        for line in arr {
            if !newArray.contains(line) {
                newArray.append(line)
            }
        }
        
        return newArray.sorted(by: { $0 < $1 })
    }
}


