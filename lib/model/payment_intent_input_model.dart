class PaymentIntentInputModel
{
  final String amount;
  final String currency;

  PaymentIntentInputModel(this.amount, this.currency);

  toJson()
  {
    return{
    'amount':amount,
    'currency':currency,
    };
  }

}