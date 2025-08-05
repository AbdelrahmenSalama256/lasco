import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const BrandCard({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72.w,
        height: 72.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                  color: Color(0Xff000000).withOpacity(0.1)),
            ]),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholderImage();
          },
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: 80.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.orange[400],
        size: 30.w,
      ),
    );
  }
}
