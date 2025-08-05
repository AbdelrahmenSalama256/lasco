import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/locale/app_loacl.dart';

import '../../../../../core/constants/app_colors.dart';
import 'brand_card.dart';

class BrandList extends StatelessWidget {
  final List<BrandModel> brands;

  const BrandList({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "brands".tr(context),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 72.h,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return BrandCard(
                imageUrl: brands[index].imageUrl,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

// Brand Model
class BrandModel {
  final String imageUrl;
  final String name; // Optional name for logging or future use

  BrandModel({
    required this.imageUrl,
    this.name = 'Unknown Brand', // Default name
  });
}
