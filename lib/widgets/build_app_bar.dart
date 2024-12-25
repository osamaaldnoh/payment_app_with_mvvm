import 'package:flutter/material.dart';

import '../res/styles.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: Styles.style24,
      textAlign: TextAlign.center,
    ),
  );
}
