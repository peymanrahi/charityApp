import 'package:charity/models/charity.dart';
import 'package:charity/models/donations.dart';
import 'package:charity/screens/addCharity.dart';
import 'package:charity/screens/admin_page.dart';
import 'package:charity/screens/donation_page.dart';
import 'package:charity/screens/splash_screen.dart';
import 'package:charity/screens/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charity/screens/charity_detail.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Charitys()),
        ChangeNotifierProvider.value(value: Donations())
      ],
      child: MaterialApp(
        title: 'charityApp',
        home: SplashScreen(),
        routes: {
          AdminPage.routeName: (ctx)=> AdminPage(),
          UserPage.routeName: (ctx)=> UserPage(),
          CharityDetail.routeName:(ctx)=> CharityDetail(),
          DonationPage.routeName: (ctx)=> DonationPage(),
          AddCharity.routeName:(ctx)=> AddCharity()

        },
      ),
    );
  }
}
