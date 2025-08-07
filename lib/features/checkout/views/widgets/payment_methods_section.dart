import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';

class PaymentMethodsSection extends StatelessWidget {
  final String selectedPaymentMethod;
  final Function(String) onPaymentSelected;

  const PaymentMethodsSection({
    super.key,
    required this.selectedPaymentMethod,
    required this.onPaymentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "payment_methods".tr(context),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onPaymentSelected('full'),
                child: Row(
                  children: [
                    Icon(
                      selectedPaymentMethod == 'full'
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selectedPaymentMethod == 'full'
                          ? AppColors.primary
                          : const Color(0XFFB2B2B2),
                      size: 20.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "full_payment".tr(context),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF515151),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () => onPaymentSelected('partial'),
                child: Row(
                  children: [
                    Icon(
                      selectedPaymentMethod == 'partial'
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selectedPaymentMethod == 'partial'
                          ? AppColors.primary
                          : const Color(0XFFB2B2B2),
                      size: 20.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "partial_payment".tr(context),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF515151),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
