import 'dart:developer';
import 'package:doctor_app/pages/doctor/specialistdoctors/special_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/assets.dart';

class DiseuseWidget extends StatefulWidget {
  final String title;
  final int index;
  const DiseuseWidget({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<DiseuseWidget> createState() => _DiseuseWidgetState();
}

class _DiseuseWidgetState extends State<DiseuseWidget> {
  Color setBgColor() {
    if (widget.index % 2 == 0) {
      return Colors.red;
    } else if (widget.index % 2 == 1) {
      return Colors.green;
    } else if (widget.index % 2 == 2) {
      return Colors.orange;
    } else {
      return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          SpecialDoctor(special: widget.title),
        );
      },
      child: SizedBox(
        height: 200.h,
        width: 120.w,
        child: Card(
          color: setBgColor(),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  radius: 40.r,
                  child: Image.asset(
                    logo,
                    height: 55.h,
                    width: 55.w,
                  ),
                ),
                Flexible(
                  child: Text(
                    widget.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
