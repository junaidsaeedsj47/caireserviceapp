import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/handyman/handyman_list_viewmodel.dart';
import '../../widgets/caire_fields.dart';
import 'chatDetailScreen.dart';
import '../service/add_service_screen.dart';
import '../service/service_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
              // bottomNavigationBar:  AppUtils.appBottomBar(context),
              backgroundColor: Colors.white,
              appBar: AppUtils.showAppBar(showBack: false,title: "Chat",context: context,centerTitle:true),
              body: Column(
                children: [
                  // Container(
                  //   height: 60,
                  //   width: double.infinity,
                  //   color: AppColors.instance.themeColor,
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  //             'Chat',
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
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 20, end: 20,top: 10),
                    child: CarieTextFieldWithoutLabel(
                      controller: controller,
                      hintText: 'Search here..',
                    //  labelText: 'Search Name',
                    ),
                  ),
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
                              return GestureDetector(
                                  onTap: (){
                                    AppUtils.pushRoute(context: context, route: ChattingDetailScreen());
                                  },
                                  child: _chatContainer());
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

  Widget _chatContainer() {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'John',
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.4,
                      ),
                      Text(
                        '2:30 pm',
                        style: TextStyleUtil.textStyleRaqiBookBold(context,
                            color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    'Hi John how are you?',
                    style: TextStyleUtil.textStyleRaqiBookBold(context,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

}
