Pod::Spec.new do |spec|
    spec.name         = 'DLDataCollectorSDK'
    spec.version      = '0.0.5'
    spec.authors      = { 'dLocal' => 'mobile-dev@dlocal.com' }
    spec.homepage     = "https://bitbucket.org/dlocal-public/data-collector-sdk-ios/"
    spec.summary      = 'dLocal - Data Collector SDK'
    spec.source       = { :http => "https://bitbucket.org/dlocal-public/data-collector-sdk-ios/downloads/DLDataCollectorSDK-#{spec.version.to_s}.zip" }
    spec.license      = { :type => 'Custom', :file => 'LICENSE' }
    spec.platform     = :ios
    spec.ios.deployment_target = '10.0'
    spec.vendored_framework = "DLDataCollectorSDK.xcframework"
end
