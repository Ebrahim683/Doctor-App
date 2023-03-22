import 'package:doctor_app/pages/doctor/search/doctor_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSearchPage extends StatefulWidget {
  const DoctorSearchPage({super.key});

  @override
  State<DoctorSearchPage> createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
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
      appBar: AppBar(
        title: const Text('Search Doctor'),
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
                hintText: 'Search doctor...',
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
                String special = specialist[index];
                if (searchController.text.toString().isEmpty) {
                  return DoctorSearchWidget(
                    name: doctorNameList[index],
                    specialist: specialist[index],
                    index: index,
                  );
                } else if (name.toLowerCase().contains(
                        searchController.text.toString().toLowerCase()) ||
                    special.toLowerCase().contains(
                        searchController.text.toString().toLowerCase())) {
                  return DoctorSearchWidget(
                    name: doctorNameList[index],
                    specialist: specialist[index],
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
