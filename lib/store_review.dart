import 'dart:async';

import 'package:flutter/services.dart';

class StoreReview {
  static const MethodChannel _channel =
      const MethodChannel('store_review');

  static Future<bool> get isAvailable async {
    return await _channel.invokeMethod('isAvailable');
  }

  static Future<void> requestReview () async {
    return await _channel.invokeMethod('requestReview');
  }

}
