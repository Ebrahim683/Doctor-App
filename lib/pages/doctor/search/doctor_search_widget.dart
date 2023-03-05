import 'dart:developer';

import 'package:doctor_app/pages/doctor/doctor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/assets.dart';

class DoctorSearchWidget extends StatefulWidget {
  final String name;
  final String specialist;
  final int index;
  const DoctorSearchWidget(
      {super.key,
      required this.name,
      required this.specialist,
      required this.index});

  @override
  State<DoctorSearchWidget> createState() => _DoctorSearchWidgetState();
}

class _DoctorSearchWidgetState extends State<DoctorSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.name),
        subtitle: Text(widget.specialist),
        leading: Image.asset(logo),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          log(widget.index.toString());
          log(widget.name.toString());
          log(widget.specialist.toString());
          Get.to(const DoctorDetailsPage());
        },
      ),
    );
  }
}
