// swift-tools-version: 6.0
/*-------------------------------------------------------------------------------------------------------------------------
     File: Package.swift
   Author: Kevin Messina
  Created: 8/20/26
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import PackageDescription

let package = Package(
    name: "CAS-External-Foundations",
    platforms: [
        .iOS(.v17),
        .macCatalyst(.v17)
    ],
    products: [
        .library(
            name: "CASExternalFoundations",
            targets: ["CASExternalFoundations"]
        )
    ],
    targets: [
        .target(
            name: "CASExternalFoundations"
        ),
        .testTarget(
            name: "CASExternalFoundationsTests",
            dependencies: ["CASExternalFoundations"]
        )
    ],
    swiftLanguageModes: [.v5]
)
