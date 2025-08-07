import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';
import 'package:lasco/features/offers/views/widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "notification".tr(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),

            // Today Section
            _buildNotificationSection(
              context,
              "today".tr(context),
              _getTodayNotifications(context),
            ),

            SizedBox(height: 24.h),

            // Recently Section
            _buildNotificationSection(
              context,
              "recently".tr(context), // Translated
              _getRecentNotifications(context),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection(
    BuildContext context,
    String title,
    List<NotificationModel> notifications,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        ...notifications.map((notification) => Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: _buildNotificationCard(notification))),
      ],
    );
  }

  Widget _buildNotificationCard(NotificationModel notification) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.r),
        border: Border(
          bottom: BorderSide(color: Color(0xffF7F7F7), width: 1.w),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Notification Icon/Logo
          _buildNotificationIcon(notification),

          SizedBox(width: 12.w),

          // Notification Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 4.h),

                // Description
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    children: _buildDescriptionSpans(notification.description),
                  ),
                ),

                SizedBox(height: 8.h),

                // Timestamp
                Text(
                  notification.timestamp,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),

          // Product Image (if available)
          if (notification.productImageUrl != null)
            Container(
              width: 50.w,
              height: 50.w,
              margin: EdgeInsets.only(left: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  notification.productImageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.local_offer,
                        color: Colors.pink[300],
                        size: 24.w,
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(NotificationModel notification) {
    if (notification.type == NotificationType.brand) {
      // Brand Logo
      return Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: notification.brandColor ?? Colors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            notification.brandLogoText ?? "M",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      // Promotional Icon
      return Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.orange.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.local_offer_outlined,
          color: AppColors.orange,
          size: 20.w,
        ),
      );
    }
  }

  List<TextSpan> _buildDescriptionSpans(String description) {
    // Split text to highlight percentage
    final regex = RegExp(r'(\d+%\s*off)');
    final parts = description.split(regex);
    final matches = regex.allMatches(description).toList();

    List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(text: parts[i]));
      }

      if (i < matches.length) {
        spans.add(
          TextSpan(
            text: matches[i].group(0),
            style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    }

    return spans;
  }

  List<NotificationModel> _getTodayNotifications(BuildContext context) {
    return [
      NotificationModel(
        id: '1',
        type: NotificationType.promotion,
        title: 'ramadan_offers_title'.tr(context),
        brandColor: Color(0xfff97847),
        description: 'ramadan_offers_description'.tr(context),
        timestamp: '11:00 AM',
      ),
      NotificationModel(
        id: '2',
        type: NotificationType.brand,
        title: 'mazaya_new_offer_title'.tr(context),
        description: '',
        timestamp: '13:00 AM',
        brandLogoText: 'mazaYa',
        brandColor: Color(0xfff97847),
        productImageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-K1ndKugOM0ftNCLMlmwQgYcPJPeK3y.png',
      ),
      NotificationModel(
        id: '3',
        type: NotificationType.promotion,
        title: 'ramadan_offers_title'.tr(context),
        description: 'ramadan_offers_description'.tr(context),
        timestamp: '11:00 AM',
      ),
    ];
  }

  List<NotificationModel> _getRecentNotifications(BuildContext context) {
    return [
      NotificationModel(
        id: '4',
        type: NotificationType.brand,
        title: 'mazaya_new_offer_title'.tr(context),
        description: '',
        timestamp: '11:00 AM',
        brandLogoText: 'Mazaya',
        brandColor: AppColors.orange,
        productImageUrl:
            'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-K1ndKugOM0ftNCLMlmwQgYcPJPeK3y.png',
      ),
      NotificationModel(
        id: '5',
        type: NotificationType.promotion,
        title: 'ramadan_offers_title'.tr(context),
        description: 'ramadan_offers_description'.tr(context),
        timestamp: '11:00 AM',
      ),
      NotificationModel(
        id: '6',
        type: NotificationType.promotion,
        title: 'ramadan_offers_title'.tr(context),
        description: 'ramadan_offers_description'.tr(context),
        timestamp: '11:00 AM',
      ),
    ];
  }
}

// Notification Models
enum NotificationType {
  promotion,
  brand,
  order,
  general,
}

class NotificationModel {
  final String id;
  final NotificationType type;
  final String title;
  final String description;
  final String timestamp;
  final String? brandLogoText;
  final Color? brandColor;
  final String? productImageUrl;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
    this.brandLogoText,
    this.brandColor,
    this.productImageUrl,
    this.isRead = false,
  });
}
