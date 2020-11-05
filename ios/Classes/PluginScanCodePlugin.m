#import "PluginScanCodePlugin.h"
#if __has_include(<plugin_scan_code/plugin_scan_code-Swift.h>)
#import <plugin_scan_code/plugin_scan_code-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_scan_code-Swift.h"
#endif

@implementation PluginScanCodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginScanCodePlugin registerWithRegistrar:registrar];
}
@end
