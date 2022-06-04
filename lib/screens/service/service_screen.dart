import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/model/service_data_model.dart';
import 'package:caireapp/screens/usersideservices/service_detail_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/service/service_screen_viewmodel.dart';
import '../../widgets/caire_fields.dart';
import 'add_service_screen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  ServiceScreenViewModel serviceScreenViewModel = ServiceScreenViewModel();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<ServiceScreenViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => serviceScreenViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppUtils.showAppBarWithAction(
                showBack: true,
                title: "All Services",
                context: context,
                actionWidget: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    AppUtils.pushRoute(
                        context: context, route: AddServiceScreen());
                  },
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            height: 55,
                            margin: const EdgeInsetsDirectional.only(
                              start: 20,
                              end: 20,
                            ),
                            child: CarieTextFieldWithoutLabel(
                              fillColor: Colors.grey.withOpacity(0.2),
                              controller: searchController,
                              hintText: 'Search here',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              hintStyle:
                                  TextStyleUtil.textStyleRaqiBook(context),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            itemCount: model.servicesData.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return _serviceContainer(
                                  context, model.servicesData[i], model);
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

  Widget _serviceContainer(
      BuildContext context, ServiceModel item, ServiceScreenViewModel model) {
    return GestureDetector(
      onTap: () {
        AppUtils.pushRoute(
            context: context, route: ServiceDetailScreen(servicesData: item,userFromViewProfile: true,));
      },
      child: Container(
        margin:
            const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
        // width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  child: Container(
                    height: 110,
                    width: 110,
                    child: Image.network(
                      item.serviceImage!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Chip(
                  padding: EdgeInsets.zero,

                  backgroundColor: AppColors.instance.themeColor,
                  shadowColor: Colors.black,
                  label: Text(
                    "\$" + item.servicePricing!,
                    // '\$130',
                    style: TextStyleUtil.textStyleRaqiBookBold(context,
                        fontSize: 11, color: Colors.white),
                  ), //Text
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: item.serviceProviderRating!,
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
                        item.serviceProviderRating!.toString(),
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            fontSize: 13, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  AutoSizeText(
                    item.serviceName!,
                    style: TextStyleUtil.textStyleRaqiBookBold(context,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          item.serviceName!,
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              fontSize: 15, color: Colors.grey),
                          // textAlign: TextAlign.s,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
