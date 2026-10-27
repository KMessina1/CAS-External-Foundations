/*-------------------------------------------------------------------------------------------------------------------------
     File: AppRating.swift
   Author: Kevin Messina
  Created: 1/7/20
 Modified: 10/27/2026 03:52 PM EDT
  Version: 4
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI
import StoreKit
#if canImport(UIKit)
import UIKit
#endif

/// Launch eligibility and review request state. StoreKit does not report the user's response.
@MainActor public enum AppRating {
    private static let launchesKey = "app.rating.launchCount"
    private static let lastLaunchKey = "app.rating.lastRequestLaunch"
    private static let lastDateKey = "app.rating.lastRequestDate"
    private static var recordedLaunch = false
    private static var requestedThisLaunch = false
    private static var forceDisplayForTesting = false

    /// Call once from the app's init. Repeated initialization within this process is ignored.
    public static func recordLaunch(forceShowForTest: Bool = false) {
        guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else { return }
        guard !recordedLaunch else { return }
        recordedLaunch = true
        #if DEBUG
        forceDisplayForTesting = forceShowForTest
        #endif
        let defaults = UserDefaults.standard
        defaults.set(defaults.integer(forKey: launchesKey) + 1, forKey: launchesKey)
    }

    private static var isEligible: Bool {
        guard recordedLaunch, !requestedThisLaunch else { return false }
        if forceDisplayForTesting { return true }
        let defaults = UserDefaults.standard
        let launches = defaults.integer(forKey: launchesKey)
        guard launches - defaults.integer(forKey: lastLaunchKey) >= 10 else { return false }
        guard let lastDate = defaults.object(forKey: lastDateKey) as? Date else { return true }
        return Date().timeIntervalSince(lastDate) >= 30 * 24 * 60 * 60
    }

    fileprivate static func requestIfEligible(_ requestReview: RequestReviewAction) {
        guard isEligible else { return }
        requestedThisLaunch = true
        // A debug preview of the prompt must not consume normal request eligibility.
        if !forceDisplayForTesting {
            let defaults = UserDefaults.standard
            defaults.set(defaults.integer(forKey: launchesKey), forKey: lastLaunchKey)
            defaults.set(Date(), forKey: lastDateKey)
        }
        requestReview()
    }

    fileprivate static func waitAndRequest(_ requestReview: RequestReviewAction) async {
        guard isEligible else { return }
        do {
            try await Task.sleep(for: .seconds(2))
            #if canImport(UIKit)
            // Allow a dismissing sheet or alert to finish before requesting StoreKit's view.
            while !Task.isCancelled {
                let windows = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
                    .filter { $0.activationState == .foregroundActive }.flatMap(\.windows)
                    .filter { $0.isKeyWindow }
                if !windows.isEmpty && windows.allSatisfy({ window in
                    guard let root = window.rootViewController else { return false }
                    return root.presentedViewController == nil && !root.isBeingDismissed
                }) { break }
                try await Task.sleep(for: .milliseconds(500))
            }
            #endif
            try Task.checkCancellation()
            requestIfEligible(requestReview)
        } catch is CancellationError {
            // Readiness changed or Dashboard disappeared; keep eligibility for its next appearance.
        } catch {
            return
        }
    }
}

private struct AppRatingModifier: ViewModifier {
    @Environment(\.requestReview) private var requestReview
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.isEnabled) private var isEnabled
    let isReady: Bool

    private var canRequest: Bool { isReady && isEnabled && scenePhase == .active }

    func body(content: Content) -> some View {
        content.task(id: canRequest) {
            guard canRequest else { return }
            await AppRating.waitAndRequest(requestReview)
        }
    }
}

public extension View {
    /// Attach to the view that owns the review presentation and knows when startup has finished.
    func appRating(isReady: Bool) -> some View {
        modifier(AppRatingModifier(isReady: isReady))
    }
}
