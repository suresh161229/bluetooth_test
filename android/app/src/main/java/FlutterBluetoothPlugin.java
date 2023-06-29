package com.example.flutter_bluetooth;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class FlutterBluetoothPlugin implements FlutterPlugin {
    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        BluetoothHelper bluetoothHelper = new BluetoothHelper(flutterPluginBinding);
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        // Clean up resources if needed
    }
}
