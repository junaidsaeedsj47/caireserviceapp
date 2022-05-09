import 'package:caireapp/screens/splashScreen/splashscreen.dart';
import 'package:caireapp/util/userDefaults.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/caireColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: AppColors.instance.themeColor)),
      home: CaireApp(),
    );
  }
}

class CaireApp extends StatelessWidget {
  const CaireApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppColors>(
          create: (context) {
            return AppColors.instance;
          },
        ),
      ],
      child: SplashScreen(),
    );
  }
}
