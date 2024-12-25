import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodListWidget extends StatelessWidget {
  PaymentMethodListWidget({
    super.key,
    required this.imageUrl,
    required this.isActive,
  });

  final String imageUrl;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 600),
      width: 100,
      height: 62,
      //alignment: Alignment.center,
      decoration: ShapeDecoration(
          //borderRadius: BorderRadius.circular(15),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isActive ? const Color(0xFF34A853) : Colors.grey,
              width: 1.50,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: <BoxShadow>[
            BoxShadow(
                blurRadius: 4,
                color: isActive ? const Color(0xFF34A853) : Colors.grey,
                spreadRadius: 0,
                offset: const Offset(0, 0))
          ]),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Center(
              child: SvgPicture.asset(
            imageUrl,
          ))),
    );
  }
}
