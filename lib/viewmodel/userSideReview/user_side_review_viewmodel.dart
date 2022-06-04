import 'package:flutter/cupertino.dart';

class UserSideReviewViewModel extends ChangeNotifier{
  TextEditingController reviewController = TextEditingController();
  double? ratingValue=0;
  initialize(BuildContext context){}
  updateRatingValue(double value){
    ratingValue=value;
    notifyListeners();
  }
}