import 'dart:developer';

// ignore: import_of_legacy_library_into_null_safe
import 'package:cool_alert/cool_alert.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/strings.dart';
import 'package:doctor_app/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:get/get.dart';

class MakeAppointMentPage extends StatefulWidget {
  final String days;
  final DateTime date;
  final double amount;

  const MakeAppointMentPage({
    super.key,
    required this.days,
    required this.date,
    required this.amount,
  });

  @override
  State<MakeAppointMentPage> createState() => _MakeAppointMentPageState();
}

class _MakeAppointMentPageState extends State<MakeAppointMentPage> {
  TimeOfDay timeOfDay = const TimeOfDay(hour: 12, minute: 30);
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final numberController = TextEditingController();
  final problemController = TextEditingController();
  String dropValue = 'Male';
  var items = ['Male', 'Female', 'Other'];
  showTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        timeOfDay = value ?? const TimeOfDay(hour: 12, minute: 30);
      });
    });
  }

  Future<void> makeSSLPayment() async {
    final sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
          // multi_card_name: "visa,master,bkash,roket",
          currency: SSLCurrencyType.BDT,
          product_category: 'appointment',
          sdkType: SSLCSdkType.TESTBOX,
          store_id: sslStoreId,
          store_passwd: sslStorePass,
          total_amount: widget.amount,
          tran_id: '1234'),
    );
    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      log(result.status!);
      if (result.status!.toLowerCase() == 'failed') {
        // ignore: use_build_context_synchronously
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: 'Fail',
            text: 'Fail to make payment');
      } else if (result.status!.toLowerCase() == 'closed') {
        // ignore: use_build_context_synchronously
        CoolAlert.show(
            context: context,
            type: CoolAlertType.warning,
            title: 'Canceled',
            text: 'Payment canceled');
      } else {
        // ignore: use_build_context_synchronously
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: 'Success',
            text: 'Payment success');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${widget.days}, ${widget.date.day} - ${widget.date.month} - ${widget.date.year}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Fee: ${widget.amount} TK',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Choose hour',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showTime();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.tealAccent,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: const Icon(
                                  Icons.alarm,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              'Appointment time: ${timeOfDay.format(context)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  header(title: 'Patient details'),
                  AppWidget.roundedTextField(
                    hint: 'Full name',
                    icon: Icons.abc_rounded,
                    controller: nameController,
                  ),
                  AppWidget.roundedTextField(
                    hint: 'Age',
                    icon: Icons.numbers,
                    controller: ageController,
                    type: TextInputType.number,
                  ),
                  AppWidget.roundedTextField(
                    hint: 'Number',
                    icon: Icons.phone,
                    controller: numberController,
                    type: TextInputType.phone,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: TextField(
                      controller: problemController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 7,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Problem',
                        hintStyle: const TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DropdownButton(
                            elevation: 0,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(15.r),
                            dropdownColor: Colors.tealAccent,
                            value: dropValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropValue = value!;
                                log(dropValue);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: MaterialButton(
                  onPressed: () {
                    log('pay later');
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
                      'Pay later and book',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: MaterialButton(
                  onPressed: () {
                    makeSSLPayment();
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
                      'Pay and book now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
