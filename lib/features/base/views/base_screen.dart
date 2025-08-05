import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lasco/core/constants/app_colors.dart'; // Ensure AppColors is imported  
import 'package:lasco/core/locale/app_loacl.dart';
import 'package:lasco/features/cart/views/cart_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/cubit/global_cubit.dart';
import '../../../core/cubit/global_state.dart';
import '../../home/view/home_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<GlobalCubit>(context);

        return Scaffold(
          body: IndexedStack(
            index: cubit.currentNavIndex,
            children: [
              HomeScreen(),
              CartScreen(),
              Scaffold(),
              Scaffold(),
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: cubit.currentNavIndex,
            onTap: (index) => cubit.changeBottomNavIndex(index),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/images/svg/home.svg",
                  color: cubit.currentNavIndex == 0
                      ? AppColors.orange
                      : const Color(0xffB2B2B2),
                ),
                title: Text(
                  "home".tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
                selectedColor: AppColors.orange,
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/home.svg",
                  color: AppColors.orange,
                ),
              ),

              /// Cart
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/images/svg/cart.svg",
                  color: cubit.currentNavIndex == 1
                      ? AppColors.orange
                      : const Color(0xffB2B2B2),
                ),
                title: Text(
                  "cart".tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
                selectedColor: AppColors.orange,
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/cart.svg",
                  color: AppColors.orange,
                ),
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/images/svg/wishlist.svg",
                  color: cubit.currentNavIndex == 2
                      ? AppColors.orange
                      : const Color(0xffB2B2B2),
                ),
                title: Text(
                  "wishlist".tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
                selectedColor: AppColors.orange,
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/wishlist.svg",
                  color: AppColors.orange,
                ),
              ),

              /// Settings
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/images/svg/profile.svg",
                  color: cubit.currentNavIndex == 3
                      ? AppColors.orange
                      : const Color(0xffB2B2B2),
                ),
                title: Text(
                  "profile".tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
                selectedColor: AppColors.orange,
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/profile.svg",
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method to demonstrate screen generation (optional, kept for reference)
}
