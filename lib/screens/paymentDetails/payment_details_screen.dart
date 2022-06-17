import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/screens/userSideReview/user_side_review_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/paymentDetails/payment_details_viewmodel.dart';
import 'package:caireapp/widgets/custom_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  _PaymentDetailsScreenState createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  PaymentDetailsViewModel paymentDetailsViewModel = PaymentDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<PaymentDetailsViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => paymentDetailsViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar:  AppUtils.showAppBar(
                  context: context,
                  title: "Payment",
                  showBack: UniversalPlatform.isWeb ? false : true),
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
                      getBookingTransactionId(context),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price Details",
                        style: TextStyleUtil.textStyleRaqiBook(context,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      userBookingCardInformation(),
                      SizedBox(
                        height: 20,
                      ),
                      paymentMethod(context, model),
                      SizedBox(
                        height: 40,
                      ),
                      paymentBookingButton(context, model)
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getBookingTransactionId(BuildContext context) {
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

  Widget userBookingCardInformation() {
    return Container(
      padding: AppUtils.unifiedPaddingOfScreen(
          start: 20, end: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadiusCard),
          color: AppColors.instance.backGroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getLabelAndAmount(label: "Price", price: "\$50"),
          Divider(),
          getLabelAndAmount(label: "Sub Total", price: "120 * 2 = \$240"),
          Divider(),
          getLabelAndAmount(label: "Discount", price: "-\$50"),
          Divider(),
          getLabelAndAmount(label: "Tax", price: "\$100"),
          Divider(),
          getTotalAmount(label: "Total Amount", price: "\$500"),
        ],
      ),
    );
  }

  Widget getLabelAndAmount(
      {String? label, String? price, double fontSize = 16}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context, fontSize: fontSize),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          price ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context,
              color: AppColors.instance.lightGreyText, fontSize: fontSize),
        )
      ],
    );
  }

  Widget getTotalAmount({String? label, String? price, double}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label ?? "",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          price ?? "",
          style: TextStyleUtil.textStyleRaqiBook(
            context,
            color: AppColors.instance.themeColor,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget paymentMethod(BuildContext context, PaymentDetailsViewModel model) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cash on delivery"),
            Radio(
                activeColor: AppColors.instance.themeColor,
                value: PaymentTypes.COD,
                groupValue: model.paymentTypes,
                onChanged: (PaymentTypes? value) {
                  model.updatePaymentName(value!);
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Online payment"),
            Radio(
                activeColor: AppColors.instance.themeColor,
                value: PaymentTypes.OP,
                groupValue: model.paymentTypes,
                onChanged: (PaymentTypes? value) {
                  model.updatePaymentName(value!);
                }),
          ],
        ),
      ],
    );
  }
  Widget paymentBookingButton(
      BuildContext context, PaymentDetailsViewModel model) {
    return CupertinoButton(
      color: AppColors.instance.themeColor,
      onPressed: () {
        AppUtils.pushRoute(context: context, route: UserSideReviewScreen());
      },
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Text(
        model.paymentNameButton,
        style: TextStyleUtil.textStyleRaqiBook(context,
            fontSize: 18, color: AppColors.instance.white),
      ),
    );
  }
}
