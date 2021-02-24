import 'package:flutter/material.dart';

class StainlessAppBar extends AppBar {
  StainlessAppBar({String title})
      : super(
            brightness: Brightness.light,
            bottomOpacity: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            elevation: 0,
            title: Text(title));
}
