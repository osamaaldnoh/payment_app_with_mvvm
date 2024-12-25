import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app_with_mvvm/data/api_keys.dart';
import 'package:payment_app_with_mvvm/data/api_network/network_api_services.dart';
import 'package:payment_app_with_mvvm/model/payment_intent_input_model.dart';
import 'package:payment_app_with_mvvm/model/paymentintintmodel/payment_intint_model/payment_intint_model.dart';

class StripeServices 
{
  final NetWorkApiServices netWorkApiServices = NetWorkApiServices();

  Future<PaymentIntintModel> createPaymentIntent({required PaymentIntentInputModel paymentIntentInputModel})
 async 
 {
    var response = await netWorkApiServices.post(url: 'https://api.stripe.com/v1/payment_intents',
     body: paymentIntentInputModel.toJson(), 
    token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntintModel.fromJson(response);
    return paymentIntentModel;
  }

  Future initPaymentSheett({required String paymentIntentClientSecret})
  async
  {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
       
        merchantDisplayName: 'osama',
      ),);
  }

  Future displayPayment()
  async
  {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePaymentIntent({required PaymentIntentInputModel paymentIntentInputModel})
  async
  {
    var paymentIntentModel =await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel);
      await initPaymentSheett(paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      );
      await displayPayment();
  }
}
