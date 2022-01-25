import 'package:camera_kit_testing/native_view/native_view_android.dart';
import 'package:camera_kit_testing/native_view/native_view_ios.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeView extends StatefulWidget {
  const NativeView({Key? key}) : super(key: key);

  @override
  State<NativeView> createState() => _NativeViewState();
}

class _NativeViewState extends State<NativeView> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;

    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery: $result %';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        _batteryLevel = batteryLevel;
      });
    });
  }

  @override
  void initState() {
    _getBatteryLevel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // return widget on Android.
        return Column(
          children: [
            Text(_batteryLevel),
            ElevatedButton.icon(
              onPressed: _getBatteryLevel,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
            const Expanded(
              child: NativeViewAndroid(),
            ),
          ],
        );
      case TargetPlatform.iOS:
        // return widget on iOS.
        return Column(
          children: [
            Text(_batteryLevel),
            ElevatedButton.icon(
              onPressed: _getBatteryLevel,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
            const Expanded(
              child: NativeViewIos(),
            ),
          ],
        );
      default:
        return const Center(
          child: Text('UNIMPLEMENTED'),
        );
    }
  }
}
