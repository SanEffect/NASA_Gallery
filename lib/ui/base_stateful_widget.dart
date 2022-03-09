import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BaseStatefulWidget> createState() => BaseStatefulWidgetState();
}

class BaseStatefulWidgetState extends State<BaseStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}