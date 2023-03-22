import 'dart:developer';

import 'package:doctor_app/pages/auth/register_page.dart';
import 'package:doctor_app/pages/introslider/intro_slider_widget.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({super.key});

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  final title = [
    'Thousand of doctors',
    'Chat with doctors',
    'Live talk with doctor'
  ];
  final description = [
    'You can easily contact with a thousand of doctors and contact for your needs',
    'Book an appointment with doctor. Chat with doctor via appointment letter and get consultation',
    'Easily connect with doctor, start voice and video call for your better treatment & prescription'
  ];
  final animations = [
    slider1Image,
    slider2Image,
    slider3Image,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                    log(currentIndex.toString());
                  });
                },
                itemCount: title.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return IntroSliderWidget(
                      animation: animations[index],
                      title: title[index],
                      description: description[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 100.w,
                    child: GestureDetector(
                      onTap: () {
                        if (currentIndex == 0) {
                          Get.to(const RegisterPage());
                        } else {
                          pageController.previousPage(
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        color: Colors.purple,
                        child: Center(
                          child: Text(
                            currentIndex == 0 ? 'Skip' : 'Back',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: title.length,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.teal,
                      activeColor: Colors.orange,
                      size: const Size.square(10.0),
                      activeSize: Size(18.0.w, 10.0.h),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0.r)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 100.w,
                    child: GestureDetector(
                      onTap: () {
                        if (currentIndex == title.length - 1) {
                          Get.to(const RegisterPage());
                        } else {
                          pageController.nextPage(
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        color: Colors.purple,
                        child: Center(
                          child: Text(
                            currentIndex == title.length - 1 ? 'Done' : 'Next',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
