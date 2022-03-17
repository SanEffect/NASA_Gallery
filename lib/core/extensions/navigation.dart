
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> navigateTo<T>(BuildContext context, Widget page) {
  return Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (context) => page));
}