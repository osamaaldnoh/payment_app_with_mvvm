import 'package:flutter/material.dart';

import '../res/styles.dart';

class buildCustomButtonWidgets extends StatelessWidget {
  buildCustomButtonWidgets({
    super.key,
    required this.title,
    this.isLoading=false,
    this.onTap,
  });
  final String title;
  bool isLoading;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: isLoading?
       const CircularProgressIndicator()
        :Text(
          title,
          style: Styles.style22,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
