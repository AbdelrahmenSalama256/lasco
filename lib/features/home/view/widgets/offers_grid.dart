import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';

import '../../../../core/component/widgets/app_button.dart';
import 'offers_section.dart';

class SpecialOffersGrid extends StatelessWidget {
  final List<OfferModel> offers;
  final VoidCallback? onViewAllPressed;

  const SpecialOffersGrid({
    super.key,
    required this.offers,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        _buildSectionHeader(),
        SizedBox(height: 16.h),

        // Offers Grid (2 columns)
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: offers.length > 4 ? 4 : offers.length, // Show max 4 items
          itemBuilder: (context, index) {
            return OfferGridCard(
              offer: offers[index],
              onPressed: () => _onOfferPressed(offers[index]),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Special Offers',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: onViewAllPressed,
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onOfferPressed(OfferModel offer) {
    if (kDebugMode) {
      print('Offer pressed: ${offer.title}');
    }
  }
}

class OfferGridCard extends StatelessWidget {
  final OfferModel offer;
  final VoidCallback? onPressed;

  const OfferGridCard({
    super.key,
    required this.offer,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 40.w,
            height: 50.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pink[200]!,
                  Colors.pink[300]!,
                ],
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Center(
              child: Icon(
                Icons.local_offer,
                color: Colors.white,
                size: 20.w,
              ),
            ),
          ),

          SizedBox(width: 8.w),

          // Offer Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  offer.category,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Action Button
          AppButton(
            text: '',
            onPressed: onPressed,
            type: AppButtonType.primary,
            isFullWidth: false,
            width: 28,
            height: 28,
            backgroundColor: Colors.orange,
            borderRadius: BorderRadius.circular(14.r),
            suffixIcon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 12.w,
            ),
          ),
        ],
      ),
    );
  }
}
