import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key, required this.title}) : super(key: key);

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