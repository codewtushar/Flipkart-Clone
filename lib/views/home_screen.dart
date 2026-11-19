import 'package:flipkart_clone/views/widgets/ad_products_section.dart';
import 'package:flipkart_clone/views/widgets/banner_section.dart';
import 'package:flipkart_clone/views/widgets/bottom_navigation.dart';
import 'package:flipkart_clone/views/widgets/home_header.dart';
import 'package:flipkart_clone/views/widgets/live_stream_card.dart';
import 'package:flipkart_clone/views/widgets/suggested_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.flipkartYellow,
            ),
          );
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                SizedBox(height: 12.h),
                ElevatedButton(
                  onPressed: controller.fetchHomeData,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.homeResponse.value == null) {
          return const Center(
            child: Text('No data available'),
          );
        }

        final homeData = controller.homeResponse.value!.data;

        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(data: homeData),

                  SizedBox(height: 12.h),

                  BannerSection(banners: homeData.banners,),

                  SizedBox(height: 16.h),

                  AdProductsSection(products: homeData.adProducts,),

                  SizedBox(height: 20.h),

                  Obx(() {
                    final products = controller.filteredProducts;

                    if (products.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.all(24.w),
                        child: const Center(
                          child: Text('No products found'),
                        ),
                      );
                    }

                    return SuggestedProducts(
                      products: products,
                    );
                  }),
                ],
              ),
            ),

            Obx(() {
              if (!controller.isLiveStreamVisible.value ||
                  homeData.liveStreams.isEmpty) {
                return const SizedBox.shrink();
              }

              return Positioned(
                right: 12.w,
                bottom: 12.h,
                child: LiveStreamCard(
                  stream: homeData.liveStreams.first,
                  onClose: () {
                    controller.isLiveStreamVisible.value = false;
                  },
                ),
              );
            }),
          ],
        );
      }
      ),

      bottomNavigationBar: Obx(() {
        if (controller.isLoading.value ||
            controller.homeResponse.value == null) {
          return const SizedBox.shrink();
        }

        return BottomNavigation(
          items: controller.homeResponse.value!.data.bottomNav,
        );
      }),
    );
  }
}
