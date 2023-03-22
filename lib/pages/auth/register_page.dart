import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_app/pages/auth/login_page.dart';
import 'package:doctor_app/utils/assets.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool secure = true;
  bool secureC = true;
  register() {
    log('register');
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
                'Sign up for free',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              AppWidget.roundedTextField(
                hint: 'Name',
                controller: nameController,
                icon: Icons.abc,
                type: TextInputType.text,
              ),
              AppWidget.roundedTextField(
                hint: 'Email',
                controller: emailController,
                icon: Icons.email,
                type: TextInputType.emailAddress,
              ),
              AppWidget.roundedTextField(
                hint: 'Phone',
                controller: phoneController,
                icon: Icons.numbers,
                type: TextInputType.phone,
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
                child: TextField(
                  obscureText: secureC,
                  controller: confirmPassController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          secureC = !secureC;
                        });
                      },
                      icon: secureC == true
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    hintText: 'Confirm password',
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
                    register();
                  },
                  color: blueGreyButtonColor,
                  elevation: 10,
                  height: 50.h,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
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
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(const LoginPage());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 43, 126, 235),
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
