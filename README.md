# DLDataCollector SDK
The DataCollector SDK collects and sends device information to improve fraud detection accuracy, and identify devices.

## Table of Contents:
1. [ Requirements ](#markdown-header-requirements)
2. [ App permissions ](#markdown-header-app-permissions)
2. [ System Frameworks ](#markdown-header-system-frameworks)
3. [ Installation ](#markdown-header-installation)
    - [ CocoaPods ](#markdown-header-cocoapods) 
    - [ Manual (XCFramework) ](#markdown-header-manual)
4. [ How to use ](#markdown-header-how-to-use)
5. [ Testing the integration ](#markdown-header-testing-the-integration)
    - [ Switching environments ](#markdown-header-switching-environments)
6. [ Objective-C ](#markdown-header-objective-c)
7. [ Sample App ](#markdown-header-sample-app)
8. [ Cross-platform frameworks ](#markdown-header-cross-platform-frameworks)
9. [ Report Issues ](#markdown-header-report-issues)
10. [ License ](#markdown-header-license)

## Requirements
- Xcode 12+
- Supports iOS 10 or higher

## App permissions
The SDK will not ask the user for any permission but if granted to the app,
they will be used to gather some information

- Location
- IDFA

## System Frameworks 

The SDK uses the following system frameworks

- Foundation
- WebKit
- UIKit
- CoreTelephony
- LocalAuthentication
- MessageUI
- CFNetwork
- CoreLocation (Optional)
- AdSupport (Optional)

## Installation
There are different ways to install the SDK:

### CocoaPods
#### This is the recommended installation process

- CocoaPods **1.10.1 or greater** is required, please verify with:
```shell
pod --version
```
- Add pod to Podfile ([Example](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp/Podfile))
```ruby
pod 'DLDataCollectorSDK', '~> 0.0.0'
```
* Run install
```shell
pod install
```
* Use **pod update** as needed to keep the sdk up to date

### Manual
* Go to [Downloads](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/downloads/) and download the latest version

* Unzip & follow the [apple docs](https://help.apple.com/xcode/mac/11.4/#/dev51a648b07) to add the xcframework to your project

## How to use

### 1) Configure SDK
The first thing to do is set up the SDK on app launch, this step is necessary to initialize the SDK.

For that simply add the setup call on app startup, we recommend adding it to application:didFinishLaunchingWithOptions in the app delegate like so:
```swift 
import DLDataCollectorSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    {...}
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let settings = DLSettings(apiKey: "API KEY")
        DLCollector.shared.setUp(settings)
        return true
    }
}
```
Replacing `apiKey` with your key.

See the SampleApp [AppDelegate](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp/SampleApp/AppDelegate.swift) for a detailed example.

If you're app is using SwiftUI and doesn't have a custom AppDelegate, put the equivalent code inside the init of the App struct like so:

```swift 
@main
struct ExampleApp: App {
    init() {
        let settings = DLSettings(apiKey: "API KEY")
        DLCollector.shared.setUp(settings)
    }
}
```

### 2) Start session
Start session will gather device information, and generate a sessionId.

This step can be done any time, but **it's recommended to call it as soon as a session is present in your
application state.**:

```swift
try? DLCollector.shared.startSession()
```

You can also associate additional data related to each session to improve the fraud prevention
score. The following example shows how to pass a user reference or id inside the `DLAdditionalData` object.

```swift
let data = DLAdditionalData(userReference: "user-id")
            
try? DLCollector.shared.startSession(additionalData: data)
```

NOTE: This method runs in a background thread and doesn't block the main thread.

See the SampleApp [ViewController](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp/SampleApp/ViewController.swift) for a detailed example

### 3) Link the session to the transaction

When the user starts the checkout transaction, gather the session id like so:

```swift
let sessionId = DLCollector.shared.getSessionId()
```

Submit this value in the payment request within the `additional_risk_data.device.event_uuid` parameter. The method can return null if a session is not available or an error occurred.

## Testing the integration
Once integrated, you can use the `.verbose` log level to see if the SDK is working. This can be done by changing the setup settings like so:
```Swift
let settings = DLSettings(apiKey: "SBX API KEY", env: .sandbox, logLevel: .verbose)
```
And looking at the console, when startSession is run, we should see the folloowing logs if everything is working:
```log
DLDataCollector 💾: Success getting session ID
DLDataCollector 💾: SessionId: 6f13dc3e-c689-4627-95f3-060c7ac525c0
```

### Switching environments

We strongly **recommend that you use the `SANDBOX` environment when testing**, and only use `PRODUCTION` in production ready builds. 

To do so, you can use the setup and `DLSettings` to configure a different environment, i.e:

```Swift
#if DEBUG
    let settings = DLSettings(apiKey: "SBX API KEY", env: .sandbox, logLevel: .verbose)
#else
    let settings = DLSettings(apiKey: "PROD API KEY", env: .production, logLevel: .silent)
#endif
```

Replacing the `apiKey` with yours for each environment.

## Objective-C
If you need to use the SDK from Objcetive-C, checkout [the sample app's ObjC wrapper](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp/SampleApp/DLCollectorObjCWrapper.swift). Then use swift interoperability as explained [here](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_swift_into_objective-c)

## App Store
If your app is distributed through the App Store, you musst comply with the App Store rules. When using this SDK you must ensure the following:
* Add a disclaimer in the app that says that device data is collected and sent to a third party (dlocal).
* If your app uses location, please add to the info.plist NSLocatioUsageeDescription keys a disclaimer that the location data will also be used in fraud prevention.

The SDK will only use location data if the app is using it already, so it is not necessary to add a location disclaimer if location is not used.

For more information please refer to [apple's documentation](https://developer.apple.com/documentation/uikit/protecting_the_user_s_privacy) for more information. 

## Sample App
In this repository there's a [sample app](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp) to showcase how to use the SDK, please refer to the code for more detailed examples.

## Cross-platform frameworks
This SDK can be included in any native app, we also made available the following plugins for cross-platform frameworks:

- [ionic capacitor plugin](https://bitbucket.org/dlocal-public/dlocal-data-collector-capacitor-plugin/src/main/)

## Report Issues
If you have a problem or find an issue with the SDK please contact us at [mobile-dev@dlocal.com](mailto:mobile-dev@dlocal.com)

## [License](LICENSE)