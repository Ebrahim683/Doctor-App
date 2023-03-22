import 'package:doctor_app/binding/getx_binding.dart';
import 'package:doctor_app/pages/splash/splash_page.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: appColor,
          useMaterial3: true,
        ),
        initialBinding: GetxBinding(),
        home: const SplashPage(),
      ),
    );
  }
}
