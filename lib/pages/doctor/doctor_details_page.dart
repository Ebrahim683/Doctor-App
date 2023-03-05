import 'dart:developer';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cool_alert/cool_alert.dart';
import 'package:doctor_app/pages/appointment/makeappointment/make_appointment_page.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  DateTime currentDateTime = DateTime.now();
  DateTime? selectedDateTime;
  String availableDays = 'Mon, Wed, Thu, Sat';
  showDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(3000),
    );
    if (selectedDate == null) {
      return;
    } else {
      setState(() {
        selectedDateTime = selectedDate;
        if (currentDateTime.month <= selectedDateTime!.month) {
          if (currentDateTime.day <= selectedDateTime!.day) {
            String days =
                DateFormat('EEEE').format(selectedDateTime!).substring(0, 3);
            if (availableDays.toLowerCase().contains(days.toLowerCase())) {
              Get.to(MakeAppointMentPage(
                days: days,
                date: selectedDateTime!,
                amount: 650.0,
              ));
            } else {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.warning,
                title: 'Warning',
                text: 'No appointment available at this date',
              );
            }
          } else {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.warning,
              title: 'Warning',
              text: 'Can not book appointment at backdated time',
            );
          }
        } else {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.warning,
            title: 'Warning',
            text: 'Can not book appointment at backdated time',
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dr. Masud Khan'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //header
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.teal, width: 0.3.w),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Row(
                          children: [
                            Image.asset(logo),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppWidget.righteousText(
                                    text: 'Dr. Masud Khan', size: 15.sp),
                                Row(
                                  children: const [
                                    Icon(Icons.star),
                                    Text('4.9 (3821 reviews)'),
                                  ],
                                ),
                                const Text(
                                  'Cardio specialist',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Text(
                                  'East West Hospital',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    //experience
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      width: double.infinity,
                      height: 160.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.black, width: 0.5.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 25.r,
                                child: const Icon(
                                  Icons.group,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                '5000+',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'Patients',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 25.r,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                '15+',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'Years Experience',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 25.r,
                                child: const Icon(
                                  Icons.reviews,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                '3800+',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'About Doctor',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'Dr. Masud Khan is the top most Cardiologist specialist in East West hospital.He achieved several awards for her wonderful contribution in medical field. He available for private consultation.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'Chamber location',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'Doctor-Zone, house#24/7, Zirabo, Ashulia, Savar, Dhaka',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'Working Time',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          '$availableDays - 9.00 AM - 2.00 PM',
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: MaterialButton(
                onPressed: () {
                  showDate();
                },
                color: bluAccButtonColor,
                elevation: 10,
                height: 50.h,
                minWidth: 100.w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: const Center(
                  child: Text(
                    'Book appointment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
