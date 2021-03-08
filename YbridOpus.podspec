#
# Run `pod_check.sh` to ensure this is a valid spec before submitting.
# Ensure that the built xcframework, this podspec and corresponding tag are all pushed to origin.
# Submit this version to Cocoapod with 'pod_push.sh'.
#
Pod::Spec.new do |s|
    s.name             = 'YbridOpus'
    s.version          = '0.7.1'
    s.summary          = 'Opus xcframework for iOS and macOS.'
    s.description      = <<-DESC
    XCFramework to use Opus Interactive Audio Codec within Swift source.
    It runs on iOS devices, iOS simulators and macOS.
                         DESC
    s.homepage         = 'https://github.com/ybrid/opus-swift'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Florian Nowotny' => 'Florian.Nowotny@nacamar.de' }
    s.source           = { :http => 'https://github.com/ybrid/opus-swift/releases/download/'+s.version.to_s+'/YbridOpus.xcframework.zip' }

    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.10'
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.framework    = 'YbridOpus'
    s.vendored_frameworks = 'YbridOpus.xcframework'
  end