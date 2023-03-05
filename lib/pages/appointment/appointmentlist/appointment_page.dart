import 'dart:developer';
import 'package:doctor_app/pages/appointment/appointmentlist/appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointMentPage extends StatefulWidget {
  const AppointMentPage({super.key});

  @override
  State<AppointMentPage> createState() => _AppointMentPageState();
}

class _AppointMentPageState extends State<AppointMentPage> {
  final searchController = TextEditingController();
  String search = '';
  List<String> doctorNameList = [
    'Dr. Masud Khan',
    'Dr. Sabbir',
    'Dr. Shobur Khan',
    'Dr. Farid',
    'Dr. Tareque',
    'Dr. Atik',
    'Dr. Shohel Arman',
    'Dr. Imran Khan',
  ];

  List<String> patientNameList = [
    'Ms. Jarina',
    'Ms. Sokina',
    'Md. Shobuj Mia',
    'Md. Karim Uddin',
    'Md. Mokhles',
    'Md. Ruhul',
    'Md. Rana',
    'Md. Farid Mia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  search = value.toString();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search appointment...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctorNameList.length,
              itemBuilder: (context, index) {
                String drName = doctorNameList[index];
                String ptName = patientNameList[index];
                if (searchController.text.toString().isEmpty) {
                  return AppointmentWidget(
                    doctorName: doctorNameList[index],
                    patientName: patientNameList[index],
                  );
                } else if (drName.toLowerCase().contains(
                        searchController.text.toString().toLowerCase()) ||
                    ptName.toLowerCase().contains(
                        searchController.text.toString().toLowerCase())) {
                  return AppointmentWidget(
                    doctorName: doctorNameList[index],
                    patientName: patientNameList[index],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
