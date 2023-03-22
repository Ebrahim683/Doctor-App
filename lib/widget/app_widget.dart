import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget {
  static Widget roundedTextField({
    String? hint,
    TextEditingController? controller,
    IconData? icon,
    TextInputType? type,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextField(
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.teal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }

  static Widget righteousText({String? text, Color? color, double? size}) {
    return Text(
      text!,
      style: TextStyle(
        color: color ?? Colors.black,
        fontFamily: 'Righteous',
        fontSize: size,
      ),
    );
  }

  static Widget roundedButton(
      {Widget? child,
      Function()? onTap,
      Color? color,
      double? height,
      double? width}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: MaterialButton(
        onPressed: () => onTap,
        color: color ?? Colors.orange,
        elevation: 10,
        height: height ?? 50.h,
        minWidth: width ?? 100.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(child: child),
      ),
    );
  }
}
