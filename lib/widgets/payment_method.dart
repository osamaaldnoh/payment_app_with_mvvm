import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_with_mvvm/view_model/my_card_view_model.dart';
import 'package:payment_app_with_mvvm/widgets/payment_method_list_widget.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({Key? key}) : super(key: key);
  final myCardViewModel = Get.put(MyCardViewModel());

  List listmethod = [
    'assets/images/card.svg',
    'assets/images/master_card.svg',
    'assets/images/paypal.svg',
  ];
  //int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: Obx(
        () {
          return myCardViewModel.isActiveCard != -1
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listmethod.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          myCardViewModel.isActiveCard.value = index;
                        },
                        child: PaymentMethodListWidget(
                          imageUrl: listmethod[index],
                          isActive: myCardViewModel.isActiveCard.value == index,
                        ),
                      ),
                    );
                  })
              : Container();
        },
      ),
    );
  }
}
