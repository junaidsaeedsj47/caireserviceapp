import 'package:caireapp/util/enum.dart';
import 'package:flutter/cupertino.dart';

class PaymentDetailsViewModel extends ChangeNotifier{
  PaymentTypes paymentTypes=PaymentTypes.COD;

String paymentNameButton='Pay';
  initialize(BuildContext context){}
  updatePaymentName(PaymentTypes name){
    paymentTypes=name;
    if(name==PaymentTypes.COD){
      paymentNameButton="Pay with Cash on delivery";
    }else if(name==PaymentTypes.OP){
      paymentNameButton="Pay with Online payment";
    }
    notifyListeners();
  }
}