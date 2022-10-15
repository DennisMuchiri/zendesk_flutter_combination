#import "FlutterZendeskCombinationPlugin.h"
#if __has_include(<flutter_zendesk_combination/flutter_zendesk_combination-Swift.h>)
#import <flutter_zendesk_combination/flutter_zendesk_combination-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_zendesk_combination-Swift.h"
#endif

@implementation FlutterZendeskCombinationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterZendeskCombinationPlugin registerWithRegistrar:registrar];
}
@end
