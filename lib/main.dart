import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vaccinate/views/SlotInfo.dart';
import 'package:vaccinate/views/home.dart';
import 'package:vaccinate/views/not_found.dart';
import 'package:vaccinate/views/vaccine_detail.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => ErrorPage()),
      getPages: [
        GetPage(name: '/', page:()=> MyHomePage(title: 'Vaccination Availability')),
        GetPage(name: '/vaccine-details/:districtId/:districtName/:stateId', page: ()=>VaccineDetails()),
        GetPage(name: '/slot-info/:date/:districtId/:districtName/:stateId', page: ()=>SlotInfo()),
      ],
      // routes:{
      //   '/':(context) => MyHomePage(title: 'Vaccination Availability'),
      //   '/vaccine-details':(context) => VaccineDetails()
      // },
      // home: MyHomePage(title: 'Vaccination Availability'),
    );
  }


}


