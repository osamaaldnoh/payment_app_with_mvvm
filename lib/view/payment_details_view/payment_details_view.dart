import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app_with_mvvm/widgets/build_app_bar.dart';
import 'package:payment_app_with_mvvm/widgets/custom_button_widget.dart';
import '../../widgets/payment_method_list_widget.dart';

class PaymentDetailsView extends StatelessWidget {
  PaymentDetailsView({super.key});

  List listmethod = [
    'assets/images/card.svg',
    'assets/images/master_card.svg',
    'assets/images/paypal.svg',
  ];
  int activeIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          title: 'Payment Details',
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PaymentDetailsView(),
            ),
            SliverToBoxAdapter(
              child: CustomCreditCardWidget(
                formKey: formKey,
                autovalidateMode: autovalidateMode,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 16,
                  ),
                  child: buildCustomButtonWidgets(
                    title: 'Payment',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class CustomCreditCardWidget extends StatelessWidget {
  CustomCreditCardWidget({
    Key? key,
    required this.formKey,
    required this.autovalidateMode,
  }) : super(key: key);

  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  GlobalKey<FormState> formKey;
  AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          autovalidateMode: autovalidateMode,
          onCreditCardModelChange: (value) {
            cardNumber = value.cardNumber;
            expiryDate = value.expiryDate;
            cardHolderName = value.cardHolderName;
            cvvCode = value.cvvCode;
            showBackView = value.isCvvFocused;
          },
          formKey: formKey,
        ),
      ],
    );
  }
}
