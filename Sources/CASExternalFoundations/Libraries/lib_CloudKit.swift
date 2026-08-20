/*-------------------------------------------------------------------------------------------------------------------------
     File: lib_CloudKit.swift
   Author: Kevin Messina
  Created: 5/19/24
 Modified: 08/20/2026 04:56 PM EDT
  Version: 2
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import Network

public var networkMonitor = NetworkMonitor()

@Observable public 
final class NetworkMonitor {
    public let networkMonitor = NWPathMonitor()
    public let workerQueue = DispatchQueue(label: "Monitor")
    public var isConnected = false
    
    public init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
       
        networkMonitor.start(queue: workerQueue)
    }
}


/// Useage: CloudKeys().integer(forKey: "app.theme.id", defaultValue: 0)
public struct CloudKeys {
    public init() {}

    // MARK: - *** INTEGER ***
    public func integer(forKey: String) -> Int {
        guard
            let result = NSUbiquitousKeyValueStore.default.object(forKey: forKey) as? Int
        else {
            return 0
        }
        
        return result
    }
    
    public func setInteger(forKey: String, value: Int) {
        NSUbiquitousKeyValueStore.default.set(value, forKey: forKey)
        NSUbiquitousKeyValueStore().synchronize()
    }

    // MARK: - *** STRING ***
    public func string(forKey: String, defaultValue: String) -> String {
        guard
            let result = NSUbiquitousKeyValueStore.default.string(forKey: forKey)
        else {
            // Put in update queue for next sync
            NSUbiquitousKeyValueStore.default.set(defaultValue, forKey: forKey)
            NSUbiquitousKeyValueStore().synchronize()
            
            return defaultValue
        }
        
        return result
    }
    
    public func setString(forKey: String, value: String) {
        NSUbiquitousKeyValueStore.default.set(value, forKey: forKey)
        NSUbiquitousKeyValueStore().synchronize()
    }
}
