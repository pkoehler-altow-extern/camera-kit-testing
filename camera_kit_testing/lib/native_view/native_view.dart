import 'dart:io';

import 'package:camera_kit_testing/native_view/native_view_android.dart';
import 'package:camera_kit_testing/native_view/native_view_ios.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NativeView extends StatelessWidget {
  const NativeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // return widget on Android.
        return const NativeViewAndroid();
      case TargetPlatform.iOS:
        // return widget on iOS.
        return const NativeViewIos();
      default:
        return const Center(
          child: Text('UNIMPLEMENTED'),
        );
    }
  }
}
