import 'package:doctor_app/pages/doctor/specialistdoctors/specialis_doctors.dart';
import 'package:doctor_app/pages/home/widget/carousel_widget.dart';
import 'package:doctor_app/pages/home/widget/diseuse_widget.dart';
import 'package:doctor_app/pages/home/widget/doctor_card_widget.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sliderItems = [
    slider1Image,
    slider2Image,
    slider3Image,
  ];
  List<String> specialist = [
    'Brain',
    'Kedny',
    'Fegeotherapy',
    'Eye',
    'Bone',
    'Medicine',
    'Hair',
    'Skin',
    'Gainy',
    'Nose',
    'Skin',
    'Neurology',
    'Dentence',
    'Hart',
    'Blood',
    'Medicine',
    'Brain',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                items:
                    sliderItems.map((e) => CarouselWidget(image: e)).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  height: 150.h,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            header(title: 'Specialist Doctors'),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  specialist.length,
                  (index) =>
                      DiseuseWidget(title: specialist[index], index: index),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            header(title: 'Top Doctors', sTitle: ''),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    List.generate(10, (index) => const DoctorCardWidget()),
              ),
            ),
            SizedBox(height: 10.h),
            header(title: 'Remended Doctors', sTitle: ''),
            SizedBox(height: 10.h),
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
              axisDirection: AxisDirection.down,
              children: List.generate(
                31,
                (index) => const DoctorCardWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header({String? title, String? sTitle}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 216, 216),
          borderRadius: BorderRadius.circular(15)),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
          InkWell(
            onTap: () {
              Get.to(const SpecialistDoctors());
            },
            child: Text(
              sTitle ?? 'See all',
              style: const TextStyle(color: Color.fromARGB(255, 104, 3, 199)),
            ),
          ),
        ],
      ),
    );
  }
}
