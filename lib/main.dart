import 'package:flutter/material.dart';
import 'package:project/app/routes/routes.dart';
import 'package:project/app/modules/home/views/order_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uswah Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.routes,
      home: OrderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
