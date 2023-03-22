import 'dart:developer';
import 'package:doctor_app/pages/introslider/intro_slider_page.dart';
import 'package:doctor_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  goToNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const IntroSliderPage());
    });
  }

  @override
  void initState() {
    super.initState();
    log('splash');
    goToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo.jpg',
              height: Get.height * 0.6,
              width: Get.width * 0.6,
            ),
            Text(
              appName,
              style: const TextStyle(
                fontFamily: 'Righteous',
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
