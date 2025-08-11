import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/component/widgets/app_text_field.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';

class BrandSearchSection extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isSearchFocused;
  final Animation<double> scaleAnimation;
  final VoidCallback onClearSearch;

  const BrandSearchSection({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isSearchFocused,
    required this.scaleAnimation,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: isSearchFocused
                        ? AppColors.orange.withOpacity(0.1)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: isSearchFocused ? 20.r : 10.r,
                    offset: Offset(0, isSearchFocused ? 4.h : 2.h),
                  ),
                ],
              ),
              child: AppTextField(
                controller: controller,
                focusNode: focusNode,
                hintText: "search_your_favorite_brands".tr(context),
                prefixIcon: Container(
                  padding: EdgeInsets.all(12.w),
                  child: Icon(
                    Icons.search_rounded,
                    color:
                        isSearchFocused ? AppColors.orange : Colors.grey[400],
                    size: 22.sp,
                  ),
                ),
                suffixIcon: controller.text.isNotEmpty
                    ? GestureDetector(
                        onTap: onClearSearch,
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          child: Icon(
                            Icons.close_rounded,
                            color: Colors.grey[400],
                            size: 20.sp,
                          ),
                        ),
                      )
                    : null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
