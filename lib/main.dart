import 'package:astro_gallery/presentation/common/tab_container_default.dart';
import 'package:flutter/material.dart';
import 'core/di/setup.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

// #

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Gallery',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.teal
        primaryColor: const Color(0xffb121b22)
        // primarySwatch: const MaterialColor(0xff010B19, {}) //#010B19
      ),
      // home: const MainScreen(),
      // home: const Tabbar(screens: [MainScreen(), GalleryScreen()],),
      home: const TabContainerDefault(key: Key("")),
    );
  }
}
