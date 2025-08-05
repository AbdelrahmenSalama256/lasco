import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/component/widgets/app_button.dart';
import 'package:lasco/core/component/widgets/app_text_field.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';

class PromoCodeSection extends StatelessWidget {
  final TextEditingController promoController;

  const PromoCodeSection({super.key, required this.promoController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: DottedBorder(
              color: Colors.grey[300]!, // Default border color
              strokeWidth: 1.0, // Thickness of the dotted line
              dashPattern: [6.0, 4.0], // [dash length, space length]
              borderType: BorderType.RRect, // Rounded rectangle
              radius: Radius.circular(8.r), // Match the original radius
              child: AppTextField(
                controller: promoController,
                hintText: "apply_promo_code".tr(context),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          AppButton(
            text: "Apply",
            onPressed: () {
              // Handle apply promo code logic here if needed
            },
            backgroundColor: AppColors.orange,
            isFullWidth: false,
            width: 80,
            height: 48,
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
