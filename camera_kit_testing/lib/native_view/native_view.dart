import 'dart:io';

import 'package:camera_kit_testing/native_view/native_view_android.dart';
import 'package:camera_kit_testing/native_view/native_view_ios.dart';
import 'package:flutter/material.dart';

class NativeView extends StatelessWidget {
  const NativeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const NativeViewAndroid();
    } else if (Platform.isIOS) {
      return const NativeViewIos();
    } else {
      return const Center(
        child: Text('UNIMPLEMENTED'),
      );
    }
  }
}
