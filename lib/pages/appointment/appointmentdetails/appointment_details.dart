// ignore: import_of_legacy_library_into_null_safe
import 'package:cool_alert/cool_alert.dart';
import 'package:doctor_app/data/model/appointment/details/appointment_details_model.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:doctor_app/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class AppointmentDetails extends StatefulWidget {
  final AppointmentDetailsModel appointmentDetailsModel;
  const AppointmentDetails({super.key, required this.appointmentDetailsModel});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Appointment',
          style: TextStyle(fontSize: 18.sp),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: const Icon(
                Icons.message,
                color: Colors.blueAccent,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: const Icon(
                Icons.call,
                color: Colors.blueAccent,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 3.w, right: 5.w),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: const Icon(
                Icons.video_call,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(logo),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: AppWidget.righteousText(
                  text: widget.appointmentDetailsModel.drName.toString()),
            ),
            SizedBox(height: 10.h),
            header(title: 'Visiting information'),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Date:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.scheduledDate.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Time:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.scheduledTime.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Location:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.industry.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Fee:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text('${widget.appointmentDetailsModel.fee} BDT'),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Payment:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.payment.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Status:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.status.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Serial:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.serial.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Token:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.token.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            header(title: 'Patient information'),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Full name:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.ptName.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Age:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.ptAge.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Phone:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.number.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Gender:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.gender.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  const Text(
                    'Problem:',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.appointmentDetailsModel.problem.toString()),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: MaterialButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Review',
                    actions: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(width: 50.w),
                      InkWell(
                        onTap: () {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: 'Review done',
                            onConfirmBtnTap: () {
                              Get.back();
                              Get.back();
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.black,
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            // controller: controller,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Your comment',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                color: bluAccButtonColor,
                elevation: 10,
                height: 50.h,
                minWidth: Get.width * 0.4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: const Center(
                  child: Text(
                    'Make review',
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

  Widget header({String? title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 216, 216),
          borderRadius: BorderRadius.circular(15.r)),
      height: 40.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
