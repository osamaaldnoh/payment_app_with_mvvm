import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_with_mvvm/data/stripe_services.dart';
import 'package:payment_app_with_mvvm/model/payment_intent_input_model.dart';

import '../data/status.dart';
import '../view/thank_you_view/thank_you_view.dart';

class MyCardViewModel extends GetxController {
  RxInt isActiveCard = 0.obs;
  RxBool isLoading = false.obs;

  final stripeService = StripeServices();

  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void addPymentIntent() {
    final paymentIntentInputModel = PaymentIntentInputModel('100', 'USD');

    stripeService
        .makePaymentIntent(paymentIntentInputModel: paymentIntentInputModel)
        .then((value) {
      print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      setRxRequestStatus(Status.COMPLETED);
      switch (rxRequestStatus.value) {
        case Status.LOADING:
          Center(
            child: CircularProgressIndicator(),
          );
          break;
        case Status.ERROR:
          SnackBar snackBar = SnackBar(content: Text('Error'));
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          break;
        case Status.COMPLETED:
          Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) {
            return ThankYouView();
          }));
          break;
      }
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
