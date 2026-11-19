import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';


class AdProductsSection extends StatelessWidget {
  final List<AdProduct> products;

  const AdProductsSection({
    super.key,
    required this.products,
  });

  String getProductImage(int id) {
    switch (id) {
      case 1:
        return 'assets/images/ads/ad_1.webp';
      case 2:
        return 'assets/images/ads/ad_2.webp';
      case 3:
        return 'assets/images/ads/ad_3.jpg';
      default:
        return 'assets/images/app_logo.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: products.take(3).map((product) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: Image.asset(
                      getProductImage(product.id),
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    product.brand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    product.ctaText,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2874F0),
                    ),
                  ),

                  Text(
                    product.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
