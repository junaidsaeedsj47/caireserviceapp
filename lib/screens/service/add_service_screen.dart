import 'package:caireapp/device/device.dart';
import 'package:caireapp/screens/dashboardScreen/dashboardScreen.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/caireColors.dart';
import '../../viewmodel/booking/booking_screen_viewmodel.dart';
import '../../viewmodel/handyman/handyman_list_viewmodel.dart';
import '../../viewmodel/service/add_service_screen_viewmodel.dart';
import '../../widgets/caire_fields.dart';
import '../service/service_screen.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  AddServiceScreenViewModel addServiceScreenViewModel =
      AddServiceScreenViewModel();
  TextEditingController controller = TextEditingController();
  String? categoryValue;
  String? addressValue;
  String? typeValue;
  String? statusValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<AddServiceScreenViewModel>.reactive(
          onModelReady: (model) {
            model.initialize(context);
          },
          viewModelBuilder: () => addServiceScreenViewModel,
          builder: (contextBuilder, model, child) {
            return Scaffold(
              appBar: AppUtils.showAppBar(context: context,title: "Add Service",showBack: true),
              backgroundColor: Colors.white,
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
                  //           Text(
                  //             'Add Service',
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: DynamicSize.height(0.04, context),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsetsDirectional.only(
                              start: 20, end: 20, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                              ),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Choose Image',
                                style: TextStyleUtil.textStyleRaqiBook(
                                  context,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Support: JPG,PNG,JPEG',
                          style: TextStyleUtil.textStyleRaqiBook(
                            context,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: DynamicSize.height(0.04, context),),
                        Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 20, end: 20, bottom: 10),
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey.withOpacity(0.1)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                    start: 10, end: 10),
                                child: CarieTextField(
                                  controller: controller,
                                  hintText: 'Enter Service Name',
                                  labelText: 'Service Name',
                                ),
                              ),

                              SizedBox(height: 20,),
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                    start: 10, end: 10),
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: DropdownButton<String>(
                                  value: categoryValue,
                                  isExpanded: true,
                                  hint: Text('Select Category'),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  underline: SizedBox(
                                    height: 0,
                                    width: 0,
                                  ),
                                  style: TextStyleUtil.textStyleRaqiBookBold(context),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      categoryValue = newValue!;
                                    });
                                  },
                                  items: <String>['Home', 'Business', 'Office']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                    start: 10, end: 10),
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: DropdownButton<String>(
                                  value: addressValue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  hint: Text('Select Address'),
                                  elevation: 16,
                                  underline: SizedBox(
                                    height: 0,
                                    width: 0,
                                  ),
                                  style: TextStyleUtil.textStyleRaqiBookBold(context),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      addressValue = newValue!;
                                    });
                                  },
                                  items: <String>['Home', 'Gym', 'Office']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsetsDirectional.only(
                                          start: 10, end: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: DropdownButton<String>(
                                        value: typeValue,
                                        isExpanded: true,
                                        hint: Text('Type'),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        underline: SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                        style: TextStyleUtil.textStyleRaqiBookBold(
                                            context),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            typeValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Full',
                                          'Half',
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsetsDirectional.only(
                                          start: 10, end: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: DropdownButton<String>(
                                        value: statusValue,
                                        isExpanded: true,
                                        hint: Text('Status'),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        underline: SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                        style: TextStyleUtil.textStyleRaqiBookBold(
                                            context),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            statusValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Pending',
                                          'Completed',
                                          'Done'
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 25, end: 25,),
                          width: double.infinity,
                          child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.instance.themeColor,
                              child: Text(
                                'Save',
                                style: TextStyleUtil.textStyleRaqiBook(context,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const ServiceScreen()),
                                // );
                              }),
                        ),
                      ],),
                    ),
                  ),
                

              
                ],
              ),
            );
          }),
    );
  }

 }
