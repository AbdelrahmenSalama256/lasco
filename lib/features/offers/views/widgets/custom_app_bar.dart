import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isCenter;
  final VoidCallback? onTap;
  final List<Widget>? action;

  const CustomAppBar(
      {super.key, this.onTap, this.title, this.isCenter, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: AppBar(
        title: Text(
          title ?? '', // Provide a default empty string to avoid null
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColors.black,
          ),
        ),
        centerTitle: isCenter ?? true,
        leading: Container(
            width: 30.w,
            height: 30.w,
            margin: EdgeInsetsDirectional.only(start: 10.w),
            decoration: BoxDecoration(
              color: Color(0XFFF7F7F7),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              CupertinoIcons.back,
              color: AppColors.orange,
              size: 25.sp,
            )),
        actions: action,
        backgroundColor: Colors.transparent,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Default AppBar height
}
