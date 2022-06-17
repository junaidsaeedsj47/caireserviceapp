import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/screens/usersideservices/viewall_services_screen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/enum.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/categories/viewall_categories_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_platform/universal_platform.dart';

class ViewAllCategoriesScreen extends StatefulWidget {
  final bool showBack, showMenuIcon;
  final UserType userType;
  const ViewAllCategoriesScreen({
    Key? key,
    this.showBack = true,
    this.showMenuIcon = false,
    this.userType=UserType.LoggedIn,
  }) : super(key: key);

  @override
  _ViewAllCategoriesScreenState createState() =>
      _ViewAllCategoriesScreenState();
}

class _ViewAllCategoriesScreenState extends State<ViewAllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    ViewAllCategoriesViewModel viewAllCategoriesViewModel =
        ViewAllCategoriesViewModel();
    return SafeArea(
        child: ViewModelBuilder<ViewAllCategoriesViewModel>.reactive(
            onModelReady: (model) {
              model.initialize(context);
            },
            viewModelBuilder: () => viewAllCategoriesViewModel,
            builder: (contextBuilder, model, child) {
              return ResponsiveWrapper.builder(
                  Scaffold(
                    appBar: AppUtils.showAppBar(
                        context: context,
                        showBack: UniversalPlatform.isWeb ? false : true,
                        title: "Categories"),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: UniversalPlatform.isWeb
                                ? EdgeInsetsDirectional.only(start: 30, end: 30)
                                : EdgeInsetsDirectional.only(
                                    start: 10, end: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: UniversalPlatform.isWeb ? 40 : 20,
                                ),
                                getCategoriesList(context, model),
                                SizedBox(
                                  height: UniversalPlatform.isWeb ? 40 : 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // maxWidth:700,
                  // minWidth: 480,
                  // defaultScale: true,
                  breakpoints: [
                    ResponsiveBreakpoint.resize(480, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  ],
                  background: Container(color: Color(0xFFF5F5F5)));
            }));
  }

  Widget getCategoriesList(
      BuildContext context, ViewAllCategoriesViewModel model) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.lisOfCategories.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey)),
        child: GestureDetector(
          onTap: () {
            AppUtils.pushRoute(
                context: context,
                route: ViewAllServicesScreen(
                  userType: widget.userType,
                  title: model.lisOfCategories[index],
                ));
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        color: AppColors.instance.backGroundColor),
                    child: Icon(
                      Icons.home_repair_service,
                      color: Colors.black,
                      size: 40,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                child: AutoSizeText(model.lisOfCategories[index],
                    softWrap: true,
                    style: TextStyleUtil.textStyleRaqiBook(context,
                        fontSize: 16, fontWeight: AppFontWeight.regular)),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: UniversalPlatform.isWeb ? 1.5 : 1,
        crossAxisCount: AppUtils.isDesktopDevice(context) ? 3 :  2,
        mainAxisSpacing: UniversalPlatform.isWeb ? 30 : 20,
        crossAxisSpacing: UniversalPlatform.isWeb ? 30 : 15,
        // childAspectRatio:,
      ),
    );
  }
}
