import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/screens/chat/chat_screen.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/screens/handyman/provider_dashboard.dart';
import 'package:caireapp/screens/profile/profile_screen.dart';
import 'package:caireapp/screens/providerSideBooking/provider_side_booking_main_screen.dart';
import 'package:caireapp/screens/userBookingMain/booking_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/paymentDetails/payment_details_viewmodel.dart';
import 'package:caireapp/viewmodel/userSideReview/user_side_review_viewmodel.dart';
import 'package:caireapp/widgets/caire_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class UserSideReviewScreen extends StatefulWidget {
  final bool providerCompletingService;
  const UserSideReviewScreen({Key? key,this.providerCompletingService=false}) : super(key: key);

  @override
  _UserSideReviewScreenState createState() => _UserSideReviewScreenState();
}

class _UserSideReviewScreenState extends State<UserSideReviewScreen> {
  UserSideReviewViewModel userSideReviewViewModel = UserSideReviewViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<UserSideReviewViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => userSideReviewViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppUtils.showAppBarWithAction(
                showBack: true,
                title: "Review on Service",
                centerTitle: false,
                context: context,
              ),
              backgroundColor: Colors.white,
              // body:     MapSample(),
              body: Container(
                padding: UniversalPlatform.isWeb
                    ? EdgeInsetsDirectional.only(start: 30, end: 30)
                    : EdgeInsetsDirectional.only(
                        top: 20, bottom: 20, start: 20, end: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getBookingTransactionId(context, model),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Your Review",
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      userSideReviewField(model),
                      SizedBox(
                        height: 20,
                      ),
                      userRatingBar(context,model),
                      SizedBox(
                        height: 40,
                      ),
                      paymentBookingButton(context),
                      SizedBox(
                        height: 20,
                      ),
                      skipReviewBookingButton(context),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getBookingTransactionId(
      BuildContext context, UserSideReviewViewModel model) {
    return Container(
      padding: AppUtils.unifiedPaddingOfScreen(
          start: 20, end: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadiusCard),
          color: AppColors.instance.backGroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Booking ID :",
            style: TextStyleUtil.textStyleRaqiBook(
              context,
            ),
          ),
          Text(
            "1233",
            style: TextStyleUtil.textStyleRaqiBook(
              context,
              color: AppColors.instance.lightGreyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget userSideReviewField(UserSideReviewViewModel model) {
    return Container(
      padding: AppUtils.unifiedPaddingOfScreen(
          start: 20, end: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadiusCard),
          color: AppColors.instance.backGroundColor),
      child: CarieTextFieldWithoutLabel(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        focusedBorderColor: AppColors.instance.lightGreyText,
        enableBorderColor: AppColors.instance.lightGreyText,
        controller: model.reviewController,
        hintText: 'Write a review',
        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
          context,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      ),
    );
  }
Widget userRatingBar(BuildContext context,UserSideReviewViewModel model){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          ignoreGestures: false,
          itemSize: 30,
          initialRating:0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          unratedColor: AppColors.instance.lightGreyText,
          itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
          itemBuilder: (context, _) =>
              Image.asset("assets/images/goldenStar.png"),
          onRatingUpdate: (rating) {
           model.updateRatingValue(rating);
          },
        ),
        Text(
          model.ratingValue.toString(),
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            color: AppColors.instance.lightGreyText,
            fontSize: 20,
          ),
        ),
      ],
    );
}

  Widget paymentBookingButton(
    BuildContext context,
  ) {
    return CupertinoButton(
      color: AppColors.instance.themeColor,
      onPressed: () {
        if(widget.providerCompletingService){
          AppUtils.moveToDashboard(
            context,
            [
              ProviderDashboardScreen(),
              ChatScreen(),
              ProviderSideBookingScreen(),
              ProfileScreen(),
            ],
          );
        }else{
        AppUtils.moveToDashboard(context,[
              DashboardScreen(),
              ChatScreen(),
              BookingMainScreen(),
              ProfileScreen(),
            ],);}
      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Submit",
        style: TextStyleUtil.textStyleRaqiBook(context,
            fontSize: 18, color: AppColors.instance.white),
      ),
    );
  }

  Widget skipReviewBookingButton(
    BuildContext context,
  ) {
    return CupertinoButton(
      color: AppColors.instance.white,
      onPressed: () {
        if(widget.providerCompletingService){
          AppUtils.moveToDashboard(
            context,
            [
              ProviderDashboardScreen(),
              ChatScreen(),
              ProviderSideBookingScreen(),
              ProfileScreen(),
            ],
          );
        }else{
          AppUtils.moveToDashboard(context,[
            DashboardScreen(),
            ChatScreen(),
            BookingMainScreen(),
            ProfileScreen(),
          ],);}
      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        "Skip",
        style: TextStyleUtil.textStyleRaqiBook(
          context,
          fontSize: 18,
        ),
      ),
    );
  }
}
