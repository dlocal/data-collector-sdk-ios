# DLDataCollector SDK

## Install
There are different ways to install the SDK:

### CocoaPods (Recommended)
- CocoaPods **1.10.1 or greater** is requried, please verify with:
```
pod --version
```
- Add pod to Podfile ([Example](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp/Podfile))
```
pod 'DLDataCollectorSDK' ~> '0.0.0'
```
* Run install
```
pod install
```


* Use **pod update** as needed to keep the sdk up to date

### Manual (not recommended)
* Go to [Downloads](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/downloads/) and download the latest version

* Unzip & follow the [apple docs](https://help.apple.com/xcode/mac/11.4/#/dev51a648b07) to add the xcframework to your project

## Quick Start
### 1) Configure SDK
The first thing to do is setup the SDK on app launch, this step is necessary to initialize the SDK.

For that simply add the setup call on app startup, we recommend adding it to application:didFinishLaunchingWithOptions in the app delegate like so:
```swift 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let settings = DLCollectorSettings(apiKey: "API KEY")
        DLCollector.shared.setUp(settings)
        return true
    }
```
Replacing "API KEY" with your key.

### 2) Start session
This step can be done any time, but we recommend to wait for the user to log in, so in a controller before the checkout flow is launched you should run:
```swift
try? DLCollector.shared.startSession()
```

### 3) Link the session to the transaction
When the user starts the checkout transaction, gather the session id like so:

```swift
let sessionId = DLCollector.shared.getSessionId()
```

Send that id in the transaction as additional info.


## Objective-C
If you need to use the SDK from Objcetive-C, checkout [the sample app's ObjC wrapper](https://bitbucket.org/dlocal-public/data-collector-sdk-ios/src/master/SampleApp/DLCollectorObjCWrapper.swift). Then use swift interoperability as explained [here](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_swift_into_objective-c)


## Sample App
In this repository there's a sample app to showcase how to use the SDK, please refer to the code for more detailed examples.