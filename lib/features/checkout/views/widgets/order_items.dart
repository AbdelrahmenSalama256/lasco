import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/locale/app_loacl.dart';

import '../cubit/checkout_cubit.dart';
import 'product_cart_card.dart';

class OrderItems extends StatelessWidget {
  final CheckoutCubit cubit;

  const OrderItems({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "order_items".tr(context),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        ...cubit.orderItems.map((item) {
          return ProductCartCard(
            image: item['imageUrl'],
            category: item['category'],
            productName: item['name'],
            price: "${item['price']} LE",
            quantity: item['quantity'],
            isOrder: true,
          );
        }),
      ],
    );
  }
}
