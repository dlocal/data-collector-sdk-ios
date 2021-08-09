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
    @objc func setUp() {
        let settings = DLCollectorSettings(apiKey: "Example API Key")
        DLCollector.shared.setUp(settings)
    }
    
    @objc func startSession() {
        try? DLCollector.shared.startSession()
    }
    
    @objc func getSession() -> String? {
        return DLCollector.shared.getSessionId()
    }
}
