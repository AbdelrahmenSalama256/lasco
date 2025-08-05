import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lasco/core/constants/app_colors.dart';
import 'package:lasco/core/locale/app_loacl.dart';

import '../../../../core/component/widgets/app_button.dart';

class AddressBottomSheet extends StatefulWidget {
  final Function(AddressModel)? onAddressSaved;

  const AddressBottomSheet({
    super.key,
    this.onAddressSaved,
  });

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  String selectedAddressType = 'Home';
  final List<String> addressTypes = ['Home', 'Office', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    "enter_address_manually".tr(context),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Address/Area Field
                  _buildTextField(
                    controller: addressController,
                    label: "address_area".tr(context),
                    hint: "enter_your_address".tr(context), // Assuming a key
                  ),

                  SizedBox(height: 16.h),

                  // City Field
                  _buildTextField(
                    controller: cityController,
                    label: "city".tr(context),
                    hint: "select_city".tr(context), // Assuming a key
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[400],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Street Name Field
                  _buildTextField(
                    controller: streetController,
                    label: "street_name".tr(context),
                    hint: "enter_street_name".tr(context), // Assuming a key
                  ),

                  SizedBox(height: 16.h),

                  // Building Name/Number Field
                  _buildTextField(
                    controller: buildingController,
                    label: "building_name_number".tr(context),
                    hint: "enter_building_name_number"
                        .tr(context), // Assuming a key
                  ),

                  SizedBox(height: 16.h),

                  // Floor/Apartment and Landmark Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: floorController,
                          label: "floor_apartment".tr(context),
                          hint: "floor_apt".tr(context), // Assuming a key
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildTextField(
                          controller: landmarkController,
                          label: "landmark".tr(context),
                          hint: "landmark".tr(context),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Address Type Selection
                  _buildAddressTypeSelection(),

                  SizedBox(height: 20.h),

                  // OR Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300])),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "or".tr(context),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300])),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Pick Exact Location
                  Center(
                    child: GestureDetector(
                      onTap: _pickExactLocation,
                      child: Text(
                        "pick_exact_location".tr(context),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.orange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),

          // Save Button
          Padding(
            padding: EdgeInsets.all(20.w),
            child: AppButton(
              text: "save".tr(context),
              onPressed: _saveAddress,
              backgroundColor: AppColors.orange,
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14.sp,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: addressTypes.map((type) {
            bool isSelected = selectedAddressType == type;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAddressType = type;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: type != addressTypes.last ? 8.w : 0,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.orange : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isSelected ? AppColors.orange : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _pickExactLocation() {
    if (kDebugMode) {
      print("Pick exact location tapped");
    }
  }

  void _saveAddress() {
    if (_validateForm()) {
      final address = AddressModel(
        address: addressController.text,
        city: cityController.text,
        street: streetController.text,
        building: buildingController.text,
        floor: floorController.text,
        landmark: landmarkController.text,
        type: selectedAddressType,
      );

      widget.onAddressSaved?.call(address);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Address saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  bool _validateForm() {
    if (addressController.text.isEmpty) {
      _showError("Please enter your address");
      return false;
    }
    if (cityController.text.isEmpty) {
      _showError("Please select a city");
      return false;
    }
    if (streetController.text.isEmpty) {
      _showError("Please enter street name");
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    streetController.dispose();
    buildingController.dispose();
    floorController.dispose();
    landmarkController.dispose();
    super.dispose();
  }
}

class AddressModel {
  final String address;
  final String city;
  final String street;
  final String building;
  final String floor;
  final String landmark;
  final String type;

  AddressModel({
    required this.address,
    required this.city,
    required this.street,
    required this.building,
    required this.floor,
    required this.landmark,
    required this.type,
  });

  @override
  String toString() {
    return '$building, $street, $address, $city';
  }
}
