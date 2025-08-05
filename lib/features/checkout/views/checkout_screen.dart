import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';
import 'package:lasco/features/offers/views/widgets/custom_app_bar.dart';

import '../../../core/component/widgets/app_button.dart';
import 'order_comfrimation_screen.dart';
import 'widgets/cart_items_section.dart';
import 'widgets/delivery_section.dart';
import 'widgets/order_details_section.dart';
import 'widgets/payment_methods_section.dart';
import 'widgets/promo_code_section.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'full';
  final TextEditingController promoController = TextEditingController();
  double subtotal = 1000.0;
  double shipping = 50.0;
  double discount = 0.0;

  double get total => subtotal + shipping - discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: CustomAppBar(
        title: "checkout".tr(context),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CartItemsSection(),
                  SizedBox(height: 16.h),
                  const DeliverySection(),
                  SizedBox(height: 16.h),
                  PaymentMethodsSection(),
                  SizedBox(height: 16.h),
                  PromoCodeSection(promoController: promoController),
                  SizedBox(height: 16.h),
                  OrderDetailsSection(
                    subtotal: subtotal,
                    shipping: shipping,
                    discount: discount,
                    total: total,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: AppButton(
              onPressed: () {
                _handleConfirmOrder();
              },
              backgroundColor: AppColors.orange,
              text: "confirm_order".tr(context),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _handleConfirmOrder() {
    // Generate order ID and navigate to confirmation
    String orderId = "123456";
    String orderDate = "Mon 4 August, 2025";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderConfirmationScreen(
          orderId: orderId,
          orderDate: orderDate,
          subtotal: subtotal,
          shipping: shipping,
          discount: discount,
        ),
      ),
    );
  }

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }
}
