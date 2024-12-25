import 'package:flutter/material.dart';

import '../res/styles.dart';

class buildOrderCardWidgets extends StatelessWidget {
  const buildOrderCardWidgets({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.style18,
          ),
          const Spacer(),
          Text(
            price,
            textAlign: TextAlign.center,
            style: Styles.style18,
          ),
        ],
      ),
    );
  }
}
