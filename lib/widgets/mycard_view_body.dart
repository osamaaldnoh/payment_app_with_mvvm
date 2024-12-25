import 'package:flutter/material.dart';
import 'package:payment_app_with_mvvm/widgets/payment_method_bottom_sheet.dart';

import 'build_order_card_widgets.dart';
import 'custom_button_widget.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/basket_image.png',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const buildOrderCardWidgets(
            title: 'Order Subtotal',
            price: r'$100',
          ),
          const buildOrderCardWidgets(
            title: 'Discount',
            price: r'$0',
          ),
          const buildOrderCardWidgets(
            title: 'Shipping',
            price: r'$8',
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 34,
          ),
          buildCustomButtonWidgets(
            title: 'Complet',
            onTap: () {
              showBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  builder: (ctx) {
                    return PaymentMethodBottomSheet();
                  });
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (_) {
              //     return PaymentDetailsView();
              //   }),
              // );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
