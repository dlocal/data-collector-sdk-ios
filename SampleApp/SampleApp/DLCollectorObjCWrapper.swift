//
//  DLCollectorObjCWrapper.swift
//  SampleApp
//
//  Created by Nicolas Rostan on 6/8/21.
//

import Foundation
import DLDataCollectorSDK

/// This is an example of how you could wrap the SDK to use it from Objective-C using
/// swift interoperability
@objc class DlCollectorWrapper: NSObject {
    // [DLCollectorWrapper setUp];
    @objc static func setUp() {
        let settings = DLSettings(apiKey: "Example API Key")
        DLCollector.shared.setUp(settings)
    }

    // [DLCollectorWrapper startSession];
    @objc static func startSession() {
        try? DLCollector.shared.startSession()
    }

    // [DLCollectorWrapper getSessionId];
    @objc static func getSessionId() -> String? {
        return DLCollector.shared.getSessionId()
    }
}
