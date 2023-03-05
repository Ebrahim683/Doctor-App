import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_app/pages/auth/register_page.dart';
import 'package:doctor_app/pages/base/base_page.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool secure = true;
  login() {
    Get.to(const BasePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: 150.h,
                width: 150.w,
              ),
              SizedBox(height: 30.h),
              Text(
                'Sign in to your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              AppWidget.roundedTextField(
                hint: 'Email',
                controller: emailController,
                icon: Icons.email,
                type: TextInputType.emailAddress,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: TextField(
                  obscureText: secure,
                  controller: passController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          secure = !secure;
                        });
                      },
                      icon: secure == true
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.teal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: MaterialButton(
                  onPressed: () {
                    login();
                  },
                  color: blueGreyButtonColor,
                  elevation: 10,
                  height: 50.h,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'n have an account? ',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(const RegisterPage());
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 43, 126, 235),
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
