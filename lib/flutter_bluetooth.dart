import 'dart:async';
import 'package:flutter/services.dart';

class FlutterBluetooth {
  static const MethodChannel _channel =
      MethodChannel('flutter_bluetooth');

  static Future<bool> enableBluetooth() async {
    try {
      final bool isEnabled = await _channel.invokeMethod('enableBluetooth');
      return isEnabled;
    } catch (e) {
      throw Exception('Failed to enable Bluetooth: $e');
    }
  }
}
