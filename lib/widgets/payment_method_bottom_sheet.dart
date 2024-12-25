import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_with_mvvm/data/status.dart';
import 'package:payment_app_with_mvvm/view/thank_you_view/thank_you_view.dart';
import 'package:payment_app_with_mvvm/widgets/payment_method.dart';

import '../view_model/my_card_view_model.dart';
import 'custom_button_widget.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  PaymentMethodBottomSheet({Key? key}) : super(key: key);

  MyCardViewModel myCardViewModel = Get.put(MyCardViewModel());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethod(),
          const SizedBox(
            height: 32,
          ),
          Obx(
            () {
              // myCardViewModel.isLoading.value =
              //     Status.LOADING == myCardViewModel.rxRequestStatus.value
              //         ? false
              //         : true;

              return buildCustomButtonWidgets(
                title: 'Completed',
                isLoading: myCardViewModel.isLoading.value,
                onTap: () {
                  myCardViewModel.addPymentIntent();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
