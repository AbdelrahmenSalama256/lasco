import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/features/offers/views/widgets/custom_app_bar.dart';

import 'widgets/delivery_section.dart';
import 'widgets/order_details_section.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final double subtotal;
  final double shipping;
  final double discount;

  const OrderConfirmationScreen({
    super.key,
    required this.orderId,
    required this.orderDate,
    this.subtotal = 1000.0,
    this.shipping = 50.0,
    this.discount = 0.0,
  });

  double get total => subtotal + shipping - discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Order Confirmation",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            // Order Progress Indicator
            _buildOrderProgress(),

            SizedBox(height: 20.h),

            // Order Information
            _buildOrderInfo(),

            SizedBox(height: 16.h),

            // Delivery Section (reusing your component)
            const DeliverySection(),

            SizedBox(height: 16.h),

            // Payment Methods Section
            _buildPaymentMethodsSection(),

            SizedBox(height: 16.h),

            // Order Items Section
            _buildOrderItemsSection(),

            SizedBox(height: 16.h),

            // Order Details Section (reusing your component)
            OrderDetailsSection(
              subtotal: subtotal,
              shipping: shipping,
              discount: discount,
              total: total,
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderProgress() {
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
          // Ordered Step
          _buildProgressStep(
            icon: Icons.shopping_cart_outlined,
            title: "Ordered",
            isActive: true,
            isCompleted: true,
          ),

          _buildProgressLine(isCompleted: false),

          // Processing Step
          _buildProgressStep(
            icon: Icons.inventory_2_outlined,
            title: "Processing",
            isActive: false,
            isCompleted: false,
          ),

          _buildProgressLine(isCompleted: false),

          // On way Step
          _buildProgressStep(
            icon: Icons.local_shipping_outlined,
            title: "On way",
            isActive: false,
            isCompleted: false,
          ),

          _buildProgressLine(isCompleted: false),

          // Delivered Step
          _buildProgressStep(
            icon: Icons.check_circle_outline,
            title: "Delivered",
            isActive: false,
            isCompleted: false,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStep({
    required IconData icon,
    required String title,
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
          title,
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

  Widget _buildOrderInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order Id: $orderId",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            orderDate,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsSection() {
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
            "Payment Methods",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(
                Icons.radio_button_checked,
                color: AppColors.primary,
                size: 18.w,
              ),
              SizedBox(width: 8.w),
              Text(
                "Full Payment",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.orange,
                size: 14.w,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  "Remaining balance due on delivery",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Order Items",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(16.w),
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
              // Product Image
              Container(
                width: 60.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-LIdLd2FfNXFXugzgvQMJwT42FyXZE3.png", // Using the actual product image from screenshot
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.local_offer,
                            color: Colors.pink[300],
                            size: 30.w,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skin Care",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Bubblzz Body Lotion",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Deliver between 10 Aug, 12 Aug",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "500 LE",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              // Quantity Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  "x2",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
