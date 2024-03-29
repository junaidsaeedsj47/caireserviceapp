import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/handyman/handyman_list_viewmodel.dart';
import '../../widgets/caire_fields.dart';

class ProviderReviewsScreen extends StatefulWidget {
  const ProviderReviewsScreen({Key? key}) : super(key: key);

  @override
  _ProviderReviewsScreenState createState() => _ProviderReviewsScreenState();
}

class _ProviderReviewsScreenState extends State<ProviderReviewsScreen> {
  HandymanListViewModel handymanListViewModel = HandymanListViewModel();
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<HandymanListViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => handymanListViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: AppColors
                      .instance.textWhiteColor, //change your color here
                ),
                centerTitle: true,
                title: Text(
                  "Reviews",
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      fontSize: 24, color: AppColors.instance.textWhiteColor),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.instance.themeColor, // Status bar
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  // Container(
                  //   height: 60,
                  //   width: double.infinity,
                  //   color: AppColors.instance.themeColor,
                  //   child: Padding(
                  //     padding:
                  //     const EdgeInsetsDirectional.only(start: 20, end: 20),
                  //     child: Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Row(
                  //         children: [
                  //           Icon(
                  //             Icons.arrow_back_ios,
                  //             color: Colors.white,
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             'Review On Services',
                  //             style: TextStyleUtil.textStyleRaqiBookBold(
                  //                 context,
                  //                 color: Colors.white,
                  //                 fontSize: 18),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: DynamicSize.height(0.1, context),
                  // ),
                  // Text(
                  //   'Customer Review',
                  //   style: TextStyleUtil.textStyleRaqiBookBold(context,
                  //       fontSize: 20,
                  //       color: Colors.black),
                  //   textAlign: TextAlign.start,
                  // ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          ListView.builder(
                            itemCount: 9,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return _reviewContainer();
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _reviewContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit',
                            style: TextStyleUtil.textStyleRaqiBook(context,
                                color: Colors.black),
                            // softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            // textAlign: TextAlign.start,
                          ),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 2.4,
                        // ),
                        Text(
                          '02 Dec',
                          style: TextStyleUtil.textStyleRaqiBookBold(context,
                              color: Colors.grey, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3.5,
                          minRating: 1,
                          itemSize: 15,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '3.5',
                          style: TextStyleUtil.textStyleRaqiBookBold(context,
                              fontSize: 13, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      // height: 33,
                      // width: 200,
                      child: Text(
                        'John',
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

}
