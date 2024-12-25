import 'package:flutter/material.dart';
import 'package:payment_app_with_mvvm/widgets/build_app_bar.dart';
import '../../widgets/mycard_view_body.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Card'),
      body: const MyCardViewBody(),
    );
  }
}
