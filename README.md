# CAS External Foundations

Private Swift package containing reusable Creative App Solutions Foundation, SwiftUI, UIKit, StoreKit, networking, file, formatting, and utility code.

## Requirements

- Xcode 16 or later
- Swift 6
- iOS 17 or later
- Mac Catalyst 17 or later

## Add to an Xcode project

In Xcode, choose **File > Add Package Dependencies**, enter this repository's HTTPS URL, and add the `CASExternalFoundations` library product to the required application targets.

```swift
import CASExternalFoundations
```

Because this repository is private, Xcode must have access to the GitHub account that owns or can read it.

## Local development

Add this folder as a local package to override the remote dependency while developing the package and an application together. Commit and push package changes here, then update the package dependency in each consuming application.

## License

©2026 Creative App Solutions, LLC. All Rights Reserved. Private and proprietary.
