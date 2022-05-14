import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/util/extensionForFontWeight.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/categories/viewall_categories_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class ViewAllCategoriesScreen extends StatefulWidget {
  final bool showBack, showMenuIcon;

  const ViewAllCategoriesScreen({
    Key? key,
    this.showBack = true,
    this.showMenuIcon = false,
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
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: AppColors
                        .instance.textWhiteColor, //change your color here
                  ),
                  centerTitle: true,
                  title: Text(
                    "Categories",
                    style:
                        TextStyleUtil.textStyleRaqiBook(context, fontSize: 24,color: AppColors.instance.textWhiteColor),
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: AppColors.instance.themeColor, // Status bar
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            getCategoriesList(context, model),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.home,
                          color: AppColors.instance.themeColor,
                        ),
                        icon: Icon(
                          Icons.home,
                          color: AppColors.instance.appIconColor,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                          activeIcon: Icon(
                            Icons.chat,
                            color: AppColors.instance.themeColor,
                          ),
                          icon: Icon(
                            Icons.chat,
                            color: AppColors.instance.appIconColor,
                          ),
                          label: 'Chat',
                          backgroundColor: Colors.yellow),
                      BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.notifications,
                          color: AppColors.instance.themeColor,
                        ),
                        icon: Icon(
                          Icons.notifications,
                          color: AppColors.instance.appIconColor,
                        ),
                        label: 'Notification',
                        backgroundColor: Colors.blue,
                      ),
                      BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.person,
                          color: AppColors.instance.themeColor,
                        ),
                        icon: Icon(
                          Icons.person,
                          color: AppColors.instance.appIconColor,
                        ),
                        label: 'Profile',
                        backgroundColor: Colors.blue,
                      ),
                    ],
                    type: BottomNavigationBarType.fixed,
                    currentIndex: model.selectedIndex,
                    selectedItemColor: AppColors.instance.appIconColor,
                    iconSize: 25,
                    onTap: model.onItemTapped,
                    elevation: 5),
              );
            }));
  }

  Widget getCategoriesList(
      BuildContext context, ViewAllCategoriesViewModel model) {
    return GestureDetector(
      onTap: () {},
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: model.lisOfCategories.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
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
                    child: const Icon(
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
                child: Text(model.lisOfCategories[index],
                    style: TextStyleUtil.textStyleRaqiBook(context,
                        fontSize: 18, fontWeight: AppFontWeight.regular)),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          // childAspectRatio:,
        ),
      ),
    );
  }
}
