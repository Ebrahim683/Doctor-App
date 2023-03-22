import 'dart:developer';

import 'package:doctor_app/pages/doctor/search/doctor_search_page.dart';
import 'package:doctor_app/pages/home/home_page.dart';
import 'package:doctor_app/pages/profile/profile_page.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:doctor_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../appointment/appointmentlist/appointment_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final pages = [
    const HomePage(),
    const AppointMentPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(logo),
                    SizedBox(width: 10.w),
                    Text(
                      appName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontFamily: 'Righteous',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        log('notifications');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    currentIndex == 0
                        ? InkWell(
                            onTap: () {
                              Get.to(const DoctorSearchPage());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.tealAccent,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: const Icon(
                                Icons.search_sharp,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home), title: const Text('Home')),
          SalomonBottomBarItem(
              icon: const Icon(Icons.line_style_sharp),
              title: const Text('Appointment')),
          SalomonBottomBarItem(
              icon: const Icon(Icons.person), title: const Text('Profile')),
        ],
        curve: Curves.easeOutCubic,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.teal,
      ),
    );
  }
}
