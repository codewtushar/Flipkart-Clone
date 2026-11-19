import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Get.offAll(() => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.flipkartYellow,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 130.w,
          height: 130.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}