package com.example.flutter_bluetooth;

import android.bluetooth.BluetoothAdapter;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class BluetoothHelper implements MethodChannel.MethodCallHandler {
    private BluetoothAdapter bluetoothAdapter;
    private MethodChannel methodChannel;

    public BluetoothHelper(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_bluetooth");
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method) {
            case "enableBluetooth":
                enableBluetooth(result);
                break;
            default:
                result.notImplemented();
        }
    }

    private void enableBluetooth(MethodChannel.Result result) {
        if (bluetoothAdapter == null) {
            result.error("BLUETOOTH_UNAVAILABLE", "Bluetooth is not available on this device", null);
            return;
        }

        if (!bluetoothAdapter.isEnabled()) {
            bluetoothAdapter.enable();
        }

        result.success(true);
    }
}
