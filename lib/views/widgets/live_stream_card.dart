import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';

class LiveStreamCard extends StatelessWidget {
  final LiveStream stream;
  final VoidCallback onClose;

  const LiveStreamCard({
    super.key,
    required this.stream,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 155.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/live/live_1.png',
                  fit: BoxFit.cover,
                ),

                if (stream.isLive)
                  Positioned(
                    top: 8.h,
                    left: 6.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 6,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            stream.badgeText ?? 'LIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 7.h,
                    ),
                    color: Colors.black54,
                    child: Text(
                      stream.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: GestureDetector(
                    onTap: onClose,
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 7.h),
            color: const Color(0xFFE3F9EB),
            child: Text(
              stream.offerText ?? '',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
