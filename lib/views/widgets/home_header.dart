import 'package:flipkart_clone/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controllers/home_controller.dart';
import '../../model/home_model.dart';

class HomeHeader extends StatelessWidget {
  final HomeData data;
  final HomeController controller = Get.find<HomeController>();

  HomeHeader({
    super.key,
    required this.data,
  });

  static const List<IconData> serviceIcons = [
    Icons.shopping_bag,
    Icons.timer,
    Icons.flight,
    Icons.local_offer,
  ];

  static const List<IconData> categoryIcons = [
    Icons.shopping_bag_outlined,
    Icons.checkroom_outlined,
    Icons.phone_android,
    Icons.laptop_mac,
    Icons.brush_outlined,
    Icons.chair_outlined,
    Icons.kitchen_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Container(
      padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE52D4F),
            Color(0xFFFF7180),
            Color(0xFFFFD6C9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Row(
            children: List.generate(
              data.serviceTabs.take(4).length,
                  (index) {
                final tab = data.serviceTabs[index];

                return Expanded(
                  child: Container(
                    height: 55.h,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      color: index == 0 ? AppColors.flipkartYellow : const Color(0xFFFFDCE4),
                      borderRadius: BorderRadius.circular(13.r),
                      border: Border.all(
                        color: Colors.white70,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index == 0)
                          Image.asset(
                            'assets/images/logo.png',
                            height: 25.h,
                            width: 30.w,
                            fit: BoxFit.contain,
                          )
                        else if (index == 1)
                          Container(
                            width: 27.w,
                            height: 25.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB83E70),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              '12',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                          Icon(
                            serviceIcons[index],
                            size: 22.sp,
                            color: const Color(0xFF344B80),
                          ),
                        SizedBox(height: 3.h),
                        Text(
                          tab.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 8.h),

          //address
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 17.sp,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          data.deliveryAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 19.sp,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                height: 32.h,
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.bolt,
                      color: Colors.deepOrange,
                      size: 17,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      '${data.supercoinBalance}',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          //searh bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44.h,
                  padding: EdgeInsets.symmetric(horizontal: 11.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xFF2874F0),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black87,
                        size: 23.sp,
                      ),
                      SizedBox(width: 10.w),

                      Expanded(
                        child: TextField(
                          onChanged: controller.updateSearch,
                          decoration: InputDecoration(
                            hintText: data.search.placeholder,
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey.shade600,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),

                      Obx(() {
                        if (controller.searchQuery.value.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return GestureDetector(
                          onTap: () {
                            controller.clearSearch();
                          },
                          child: Icon(
                            Icons.close,
                            size: 19.sp,
                            color: Colors.grey,
                          ),
                        );
                      }),

                      if (data.search.voiceEnabled)
                        Icon(
                          Icons.mic_none,
                          color: Colors.grey.shade700,
                          size: 22.sp,
                        ),
                    ],
                  ),
                ),
              ),

              if (data.search.scanEnabled) ...[
                SizedBox(width: 12.w),
                Icon(
                  Icons.document_scanner_outlined,
                  size: 28.sp,
                  color: Colors.black54,
                ),
              ],
            ],
          ),


          SizedBox(height: 10.h),

          // 4. Categories
          SizedBox(
            height: 68.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.categories.length,
              itemBuilder: (context, index) {
                final category = data.categories[index];

                return Obx(() {
                  final isSelected = controller.selectedCategoryId.value == category.id;

                  return GestureDetector(
                    onTap: () {
                      controller.selectCategory(category);
                    },
                    child: Container(
                      width: 72.w,
                      margin: EdgeInsets.only(right: 2.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categoryIcons[index % categoryIcons.length],
                            size: 22.sp,
                            color: isSelected ? const Color(0xFF2874F0) : Colors.black87,),
                          SizedBox(height: 5.h),
                          Text(
                            category.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? const Color(0xFF2874F0) : Colors.black87,
                            ),
                          ),
                          if (isSelected)
                            Container(
                              height: 4.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2874F0),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
