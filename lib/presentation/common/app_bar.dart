import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants.dart';

PreferredSizeWidget appBarWidget(String title, List<Widget>? appBarActions) {
  return AppBar(
      title: Text(title),
      backgroundColor: Constants.appBarBackgroundColor,
      actions: appBarActions);
}
