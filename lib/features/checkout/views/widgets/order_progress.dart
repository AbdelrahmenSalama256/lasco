import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';

import '../cubit/checkout_cubit.dart';

class OrderProgress extends StatelessWidget {
  final CheckoutCubit cubit;

  const OrderProgress({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildProgressStep(
            context,
            icon: Icons.shopping_cart_outlined,
            titleKey: "order_status_ordered",
            isActive: true,
            isCompleted: true,
          ),
          _buildProgressLine(isCompleted: true),
          _buildProgressStep(
            context,
            icon: Icons.inventory_2_outlined,
            titleKey: "order_status_processing",
            isActive: cubit.orderId != null,
            isCompleted: cubit.orderId != null,
          ),
          _buildProgressLine(isCompleted: false),
          _buildProgressStep(
            context,
            icon: Icons.local_shipping_outlined,
            titleKey: "order_status_on_way",
            isActive: false,
            isCompleted: false,
          ),
          _buildProgressLine(isCompleted: false),
          _buildProgressStep(
            context,
            icon: Icons.check_circle_outline,
            titleKey: "order_status_delivered",
            isActive: false,
            isCompleted: false,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStep(
    BuildContext context, {
    required IconData icon,
    required String titleKey,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: isActive
                ? Color(0xfff97847).withOpacity(0.2)
                : Color(0xffF7F7F7),
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.orange : Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: isActive ? AppColors.orange : Colors.grey[400],
            size: 24.w,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          titleKey.tr(context),
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? AppColors.orange : Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProgressLine({required bool isCompleted}) {
    return Expanded(
      child: Container(
        height: 2.h,
        margin: EdgeInsets.only(bottom: 35.h, left: 8.w, right: 8.w),
        decoration: BoxDecoration(
          color: isCompleted ? AppColors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(1.r),
        ),
      ),
    );
  }
}
