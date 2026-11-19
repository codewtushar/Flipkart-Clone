import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';

class BannerSection extends StatefulWidget {
  final List<HomeBanner> banners;

  const BannerSection({
    super.key,
    required this.banners,
  });

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController pageController = PageController();
  int currentPage = 0;

  String getBannerImage(int id) {
    switch (id) {
      case 1:
        return 'assets/images/banners/banner3.png';
      case 2:
        return 'assets/images/banners/banner2.png';
      default:
        return 'assets/images/app_logo.png';
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 165.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = widget.banners[index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      getBannerImage(banner.id),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: 10.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
                (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 6.h,
                width: currentPage == index ? 18.w : 6.w,
                decoration: BoxDecoration(
                  color: currentPage == index ? const Color(0xFF2874F0) : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
