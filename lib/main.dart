import 'package:astro_gallery/core/di/main_container.dart';
import 'package:astro_gallery/presentation/common/tab_container_default.dart';
import 'package:flutter/material.dart';

import 'core/constants.dart';

void main() {
  MainContainer().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Gallery',
      theme: ThemeData(
        primaryColor: Constants.primaryColor
        // primarySwatch: const MaterialColor(0xff010B19, {}) //#010B19
      ),
      home: const TabContainerDefault(key: Key("")),
    );
  }
}
