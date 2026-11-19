import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';


class BottomNavigation extends StatefulWidget {
  final List<BottomNavItem> items;

  const BottomNavigation({
    super.key,
    required this.items,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late String selectedSlug;

  @override
  void initState() {
    super.initState();

    selectedSlug = widget.items
        .firstWhere(
          (item) => item.isSelected,
      orElse: () => widget.items.first,
    )
        .slug;
  }

  IconData getIcon(String slug) {
    switch (slug) {
      case 'home':
        return Icons.home_rounded;
      case 'play':
        return Icons.play_circle_outline;
      case 'categories':
        return Icons.grid_view_rounded;
      case 'account':
        return Icons.person_outline;
      case 'cart':
        return Icons.shopping_cart_outlined;
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 6.h),
        child: Row(
          children: [
            // Navigation bar
            Expanded(
              child: Container(
                height: 66.h,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: widget.items.map((item) {
                    final isSelected = selectedSlug == item.slug;

                    return Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(35.r),
                        onTap: () {
                          setState(() {
                            selectedSlug = item.slug;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFE9EBF2) : Colors.transparent,
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                getIcon(item.slug),
                                size: 25.sp,
                                color: isSelected ? const Color(0xFF2874F0) : Colors.black87,
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                item.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: isSelected ? const Color(0xFF2874F0) : Colors.black87,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(width: 8.w),

            Container(
              width: 58.w,
              height: 58.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF536DFE),
                    Color(0xFF9C27B0),
                    Color(0xFFFF4081),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 27.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
