# CAS External Foundations

Public Swift package containing reusable Creative App Solutions Foundation, SwiftUI, UIKit, StoreKit, networking, file, formatting, and utility code.

## Requirements

- Xcode 16 or later
- Swift 6
- iOS 17 or later
- Mac Catalyst 17 or later

## Add to an Xcode project

In Xcode, choose **File > Add Package Dependencies**, enter the public repository URL below, select the desired version rule, and add the `CASExternalFoundations` library product to the required application targets.

```text
https://github.com/KMessina1/CAS-External-Foundations.git
```

```swift
import CASExternalFoundations
```

No GitHub account or private-repository authentication is required to download this public package.

## What's New

### 1.1.8

Fixed image loader fallback issues.

## Local development

Add this folder as a local package to override the remote dependency while developing the package and an application together. Commit and push package changes here, then update the package dependency in each consuming application.

## License

©2026 Creative App Solutions, LLC. All Rights Reserved. The source is publicly viewable, but no permission to copy, modify, or redistribute it is granted except as expressly authorized by Creative App Solutions, LLC.
