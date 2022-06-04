import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppAlertAction {
  String? title;
  bool? showWhiteButton = false;
  AppAlertHandler? handler;
  Color? confirmButtonColor;

  AppAlertAction({this.title, this.handler, this.showWhiteButton = false,this.confirmButtonColor});
}

typedef void AppAlertHandler(AppAlertAction action);

class ShowPopup extends StatefulWidget {
  final String title, description;
  final List<AppAlertAction> actions;
  final Image? image;

  ShowPopup({
    required this.title,
    required this.description,
    required this.actions,
    this.image,
  });

  @override
  State<StatefulWidget> createState() {
    return _ShowPopupState(
      title: this.title,
      actions: this.actions,
      description: this.description,
    );
  }
}

class _ShowPopupState extends State<ShowPopup> {
  final String title, description;
  List<AppAlertAction> actions;

  _ShowPopupState({
    required this.title,
    required this.description,
    required this.actions,
  });


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: AppUtils.dialogPadding(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context,),
    );
  }

  dialogContent(BuildContext context,) {
    Widget buttonsWidget;
    List<Widget> actionWidgets = [
      SizedBox(height: 50.0),
      if (widget.image != null) widget.image!,
      if (widget.image != null) SizedBox(height: 20.0),
      Text(
        widget.title ?? "",
        style: TextStyleUtil.textStyleRaqiBook(
            context, fontSize: 25, color: AppColors.instance.black),
      ),
      SizedBox(height: 20.0),
      Text(
        widget.description ?? "",
        style: TextStyleUtil.textStyleRaqiBook(
            context, fontSize: 15, color: AppColors.instance.lightGreyText),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 32.0),
    ];

    for (int i = 0; i < widget.actions.length; i++) {
      AppAlertAction action = widget.actions[i];
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
            style: TextStyleUtil.textStyleRaqiBook(
                context, color: AppColors.instance.lightGreyText),
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

  Widget _proceedButton(BuildContext context, AppAlertAction action) {
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
          style: TextStyleUtil.textStyleRaqiBook(
              context, color: AppColors.instance.white),
        ),
      ),
    );
  }
}