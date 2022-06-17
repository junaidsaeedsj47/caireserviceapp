import 'package:auto_size_text/auto_size_text.dart';
import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/constants/constants.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:caireapp/viewmodel/reschedule_booking/reschedule_booking_viewmodel.dart';
import 'package:caireapp/widgets/caire_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked/stacked.dart';

class AppAlertActionReSchedule {
  String? title;
  bool? showWhiteButton = false;
  AppAlertHandler? handler;
  Color? confirmButtonColor;

  AppAlertActionReSchedule(
      {this.title,
      this.handler,
      this.showWhiteButton = false,
      this.confirmButtonColor});
}

typedef void AppAlertHandler(AppAlertActionReSchedule action);

class ReScheduleBooking extends StatefulWidget {
  final String title;
  final String? description;
  final List<AppAlertActionReSchedule> actions;
  final Image? image;

  ReScheduleBooking({
    required this.title,
    this.description,
    required this.actions,
    this.image,
  });

  @override
  State<StatefulWidget> createState() {
    return _ReScheduleBookingState(
      title: this.title,
      actions: this.actions,
      description: this.description,
    );
  }
}

class _ReScheduleBookingState extends State<ReScheduleBooking> {
  final String title;
  final String? description;
  List<AppAlertActionReSchedule> actions;

  _ReScheduleBookingState({
    required this.title,
    required this.description,
    required this.actions,
  });

  ReScheduleBookingViewModel reScheduleBookingViewModel =
      ReScheduleBookingViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReScheduleBookingViewModel>.reactive(
        onModelReady: (model) {
          model.initialize(context);
        },
        viewModelBuilder: () => reScheduleBookingViewModel,
        builder: (buildContext, model, index) {
          return Dialog(
            insetPadding: AppUtils.dialogPadding(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: dialogContent(
              context,
              model,
            ),
          );
        });
  }

  dialogContent(BuildContext context, ReScheduleBookingViewModel model) {
    Widget buttonsWidget;
    List<Widget> actionWidgets = [
      SizedBox(height: 50.0),
      if (widget.image != null) widget.image!,
      if (widget.image != null) SizedBox(height: 20.0),
      Text(
        widget.title ?? "",
        style: TextStyleUtil.textStyleRaqiBook(context,
            fontSize: 25, color: AppColors.instance.black),
      ),
      // SizedBox(height: 20.0),
      // Text(
      //   widget.description ?? "",
      //   style: TextStyleUtil.textStyleRaqiBook(context,
      //       fontSize: 15, color: AppColors.instance.lightGreyText),
      //   textAlign: TextAlign.center,
      // ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [selectDate(model), selectTime(model)],
      ),
      SizedBox(height: 20.0),
      providerReScheduleField(model),
      SizedBox(height: 32.0),
    ];
    for (int i = 0; i < widget.actions.length; i++) {
      AppAlertActionReSchedule action = widget.actions[i];
      if (i != 0) {
        actionWidgets.add(SizedBox(height: 8.0));
      }

      if (!action.showWhiteButton!) {
        actionWidgets.add(_proceedButton(context, action));
      } else {
        actionWidgets.add(InkWell(
          onTap: () {
            if (action.handler == null) {
              Navigator.of(context, rootNavigator: true).pop();
            } else {
              action.handler!(action!);
            }
          },
          child: Text(
            action.title ?? "",
            style: TextStyleUtil.textStyleRaqiBook(context,
                color: AppColors.instance.lightGreyText),
            textAlign: TextAlign.center,
          ),
        ));
      }
    }
    if (widget.actions.length == 1) {
      actionWidgets.add(SizedBox(height: 50.0));
    } else {
      actionWidgets.add(SizedBox(height: 29.0));
    }
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsetsDirectional.only(
                top: 0,
                bottom: 0,
                start: 24,
                end: 24,
              ),
              margin: EdgeInsetsDirectional.only(top: 0),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Container(
                width: double.infinity,
                child: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // To make the card compact
                  children: actionWidgets,
                ),
              )),
        ],
      ),
    );
  }

  Widget selectDate(ReScheduleBookingViewModel model) {
    return Container(
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.instance.white),
      child: GestureDetector(
        onTap: () {
          DatePicker.showDatePicker(context,
              minTime: DateTime.now(),
              maxTime: DateTime(2050, 01, 01),
              showTitleActions: true,
              onChanged: (date) {}, onConfirm: (date) {
            model.updateSelectedDate(date);
          }, currentTime: DateTime.now());
        },
        child: Container(
          width: 100,
          padding:
              EdgeInsetsDirectional.only(top: 6, end: 8, start: 8, bottom: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.instance.backGroundColor),
          child: Center(
              child: AutoSizeText(
            model.showDate
                ? AppUtils.showFormattedDate(model.selectedDate)
                : "Select Date",
            style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context),
          )),
        ),
      ),
    );
  }

  Widget selectTime(ReScheduleBookingViewModel model) {
    return Container(
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.instance.white),
      child: GestureDetector(
        onTap: () {
          DatePicker.showTimePicker(
            context,
            showTitleActions: true,
            onChanged: (date) {
              // model.updateSelectedTime(date);
            },
            onConfirm: (date) {
              model.updateSelectedTime(date);
            },
            currentTime: DateTime.now(),
          );
        },
        child: Container(
          width: 100,
          padding:
              EdgeInsetsDirectional.only(top: 6, end: 8, start: 8, bottom: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.instance.backGroundColor),
          child: Center(
              child: AutoSizeText(
            model.showTime
                ? AppUtils.showFormattedTime(model.selectedTime)
                : "Select Time",
            // model.selectedTime.hour.toString() +
            //     ":" +
            //     model.selectedTime.minute.toString(),
            style: TextStyleUtil.textStyleBeforeLoginRaqiBook(context),
          )),
        ),
      ),
    );
  }

  Widget providerReScheduleField(ReScheduleBookingViewModel model) {
    return Container(
      // padding: AppUtils.unifiedPaddingOfScreen(
      //     start: 20, end: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadiusCard),
          color: AppColors.instance.backGroundColor),
      child: CarieTextFieldWithoutLabel(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        focusedBorderColor: AppColors.instance.lightGreyText,
        enableBorderColor: AppColors.instance.lightGreyText,
        controller: model.scheduleComment,
        hintText: 'Write a message',
        hintStyle: TextStyleUtil.textStyleBeforeLoginRaqiBook(
          context,
        ),
        // contentPadding:
        //     const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      ),
    );
  }

  Widget _proceedButton(BuildContext context, AppAlertActionReSchedule action) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: action.confirmButtonColor ?? AppColors.instance.themeColor,
        onPressed: () {
          if (action.handler == null) {
            Navigator.of(context, rootNavigator: true).pop();
          } else {
            action.handler!(action);
          }
        },
        child: Text(
          action.title ?? "",
          style: TextStyleUtil.textStyleRaqiBook(context,
              color: AppColors.instance.white),
        ),
      ),
    );
  }
}
