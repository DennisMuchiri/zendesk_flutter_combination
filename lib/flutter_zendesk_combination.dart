
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterZendeskCombination {
  static const MethodChannel _channel = MethodChannel('flutter_zendesk_combination');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
