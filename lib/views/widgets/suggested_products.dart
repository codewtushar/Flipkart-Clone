import 'package:flipkart_clone/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../model/home_model.dart';


class SuggestedProducts extends StatelessWidget {
  final List<SuggestedProduct> products;

  const SuggestedProducts({
    super.key,
    required this.products,
  });

  String getProductImage(int id) {
    switch (id) {
      case 1:
        return 'assets/images/suggested/product_1.webp';
      case 2:
        return 'assets/images/suggested/product_2.webp';
      default:
        return 'assets/images/app_logo.png';
    }
  }

  String formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return count.toString();
  }


  Widget buildProductCard(SuggestedProduct product) {
    return GestureDetector(
      onTap: (){
        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Container(
        width: 155.w,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 115.h,
              width: double.infinity,
              child: Image.asset(
                getProductImage(product.id),
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              product.brand,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey.shade600,
              ),
            ),

            SizedBox(height: 3.h),

            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 6.h),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.green,
                ),
                SizedBox(width: 3.w),
                Text(
                  '${product.rating} (${formatCount(product.ratingCount)})',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            Row(
              children: [
                Text(
                  '₹${product.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  '₹${product.mrp.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            SizedBox(height: 3.h),

            Text(
              '${product.discountPercent}% off',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Suggested for You',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        SizedBox(
          height: 270.h,
          child: Stack(
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return buildProductCard(products[index]);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
