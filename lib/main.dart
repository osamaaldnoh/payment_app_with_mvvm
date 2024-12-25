import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:payment_app_with_mvvm/data/api_keys.dart';
import 'package:payment_app_with_mvvm/view/mycard/my_card_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publicKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyCardView(),
    );
  }
}
