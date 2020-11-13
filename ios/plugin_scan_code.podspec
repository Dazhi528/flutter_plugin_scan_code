#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run pod lib lint plugin_scan_code.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'plugin_scan_code'
  s.version          = '1.0.1'
  s.summary          = 'Flutter plugin scan code'
  s.description      = <<-DESC
Flutter plugin scan qrcode and barcode From Android and Ios
支持Android和Ios双系统条码识别二维码和条码
                       DESC
  s.homepage         = 'https://github.com/Dazhi528'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Dazhi528' => 'wzz528@icloud.com' }
  s.source           = { :path => '.' }
  s.source           = { :git => 'https://github.com/Dazhi528/ScanCode.git' }
  s.source_files = 'Classes/**/*'
  
#  s.resource_bundles = {
#      'plugin_scan_code' => ['Assets/**/*']
#  }
  s.resources = ['Assets/**/*']

  s.dependency 'Flutter'
  s.dependency 'ScanCode'
  s.platform = :ios, '10.0'
  s.swift_version = '5.0'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
