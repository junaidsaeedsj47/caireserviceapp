import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProviderDashboardViewModel extends ChangeNotifier{
  List<StatsModel> statsItem = [
    StatsModel(
      title: '12',
      description: 'Total Bookings',
      icon: Icon(Icons.book),
    ),
    StatsModel(
      title: '2',
      description: 'Total Service',
      icon: Icon(Icons.shopping_bag_outlined),
    ),
    StatsModel(
      title: '4',
      description: 'Total Users',
      icon: Icon(Icons.supervised_user_circle_sharp),
    ),
    StatsModel(
      title: '\$2300',
      description: 'Total Earnings',
      icon: Icon(Icons.monetization_on_sharp),
    ),
  ];

  List<String> providerList = [
    'John',
    'Alex',
    'Abraham',
    'Aley',
  ];
  initialize(BuildContext context){}
}
class StatsModel {
  final String? title;
  final Icon? icon;
  final String? description;

  StatsModel({this.title, this.icon, this.description});
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
