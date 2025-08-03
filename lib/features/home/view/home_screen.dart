import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lasco/core/component/widgets/app_text_field.dart';
import 'package:lasco/core/constants/app_colors.dart';

import 'widgets/offers_grid.dart';
import 'widgets/offers_section.dart';
import 'widgets/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              //! WelcomeHeader
              Text(
                "Welcome Back,",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secoundry,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Sarah... Let’s go shopping",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 10.h),
              //! Search Bar
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: TextEditingController(),
                      hintText: "Search products",
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        size: 25.sp,
                        color: const Color(0xffB3B3B3),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF7F7F7),
                        ),
                        child: Icon(
                          CupertinoIcons.bell,
                          size: 20.sp,
                          color: AppColors.black,
                        ),
                      ),
                      PositionedDirectional(
                        end: 0,
                        top: 0,
                        child: Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      //! Banner
                      Image.asset(
                        "assets/images/png/banner.png",
                        width: double.infinity,
                        // height: 149.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.h),
                      //! Categories
                      Column(
                        children: [
                          //// Cat item
                          Container(
                            width: 66.w,
                            height: 66.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 15.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color(0xFFf7f7f7),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/svg/lotion.svg",
                              width: 34.w,
                              height: 34.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Skin Care",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      // Big Deals Section with Reusable Cards
                      ProductGrid(
                        childAspectRatio: 0.60,
                        title: "Big Deals",
                        products: _getBigDealsProducts(),
                      ),

                      SizedBox(height: 20.h),

                      // Alternative: Special Offers Grid (2x2 layout)
                      SpecialOffersGrid(
                        offers: _getSpecialOffers(),
                        onViewAllPressed: () {
                          print('View All Offers pressed');
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<OfferModel> _getSpecialOffers() {
    return [
      OfferModel(
        id: '1',
        title: 'Buy 2 Get 1 free',
        category: 'Skin Care',
        description: 'Special offer on all skincare products',
      ),
      OfferModel(
        id: '2',
        title: 'Buy 2 Get 1 free',
        category: 'Skin Care',
        description: 'Limited time offer on beauty products',
      ),
      OfferModel(
        id: '3',
        title: '50% Off Electronics',
        category: 'Electronics',
        description: 'Huge discount on electronic items',
      ),
      OfferModel(
        id: '4',
        title: 'Free Shipping',
        category: 'All Categories',
        description: 'Free shipping on orders above 50',
      ),
    ];
  }

  List<ProductModel> _getBigDealsProducts() {
    return [
      ProductModel(
        id: '1',
        imageUrl: "assets/images/png/test-product.png",
        name: 'NIVEA Sun Care',
        category: 'Skin Care',
        rating: 4.5,
        price: '500 LE',
        isOnSale: true,
        isFavorite: false,
      ),
      ProductModel(
        id: '2',
        name: 'NIVEA Body Lotion',
        category: 'Skin Care',
        rating: 4.5,
        imageUrl: "assets/images/png/test-product.png",
        price: '500 LE',
        isOnSale: true,
        isFavorite: false,
      ),
    ];
  }

  List<ProductModel> _getJBLProducts() {
    return [
      ProductModel(
        id: '3',
        imageUrl: "assets/images/png/test-product.png",
        name: 'JBL Club Pro',
        category: 'Audio',
        rating: 4.5,
        price: '60.15',
        isOnSale: false,
        isFavorite: false,
      ),
      ProductModel(
        id: '4',
        imageUrl: "assets/images/png/test-product.png",
        name: 'JBL Club Pro',
        category: 'Audio',
        rating: 4.0,
        price: '60.15',
        isOnSale: false,
        isFavorite: false,
      ),
    ];
  }
}
