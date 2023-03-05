import 'package:doctor_app/pages/doctor/doctor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets.dart';
import '../search/doctor_search_widget.dart';

class SpecialDoctor extends StatefulWidget {
  final String special;
  const SpecialDoctor({super.key, required this.special});

  @override
  State<SpecialDoctor> createState() => _SpecialDoctorState();
}

class _SpecialDoctorState extends State<SpecialDoctor> {
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
    'Dr. Asraf Ali',
    'Dr. Santo khan',
    'Dr. Kala Chand',
    'Dr. Nazrul',
    'Dr. Omor Hadi',
    'Dr. Moniruzzaman',
    'Dr. Abdus Sattar',
    'Dr. Abbas Ali',
    'Dr. Fazle Rabby',
  ];
  List<String> medicalList = [
    'East West Medical and Hospital',
    'Popular Hospital',
    'PMK Hospital',
    'Child Hospital',
    'Lab-Zone Hospital',
    'Lab-One Hospital',
    'Nazrul Medical College',
    'শিশু হসপিটাল',
    'Daffodil Hospital',
    'Popular Hospital',
    'PMK Hospital',
    'Child Hospital',
    'Lab-Zone Hospital',
    'Lab-One Hospital',
    'Nazrul Medical College',
    'Shishu Hospital',
    'Daffodil Hospital',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.special} Specialist'),
      ),
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
                hintText: 'Search medical...',
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
                String name = doctorNameList[index];
                String medical = medicalList[index];
                if (searchController.text.toString().isEmpty) {
                  return DoctorSearchWidget(
                    name: doctorNameList[index],
                    specialist: medicalList[index],
                    index: index,
                  );
                } else if (medical
                    .toLowerCase()
                    .contains(searchController.text.toString().toLowerCase())) {
                  return DoctorSearchWidget(
                    name: doctorNameList[index],
                    specialist: medicalList[index],
                    index: index,
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
