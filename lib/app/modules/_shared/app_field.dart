import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class AppField extends TextFormField {
  AppField(
      {TextEditingController controller,
      TextInputType keyboardType,
      bool autofocus = false,
      Widget prefixIcon,
      bool readOnly = false,
      bool showCursor,
      void Function() onTap,
      String hintText,
      String Function(String) validator,
      bool isSearch = false})
      : super(
          controller: controller,
          keyboardType: keyboardType,
          autofocus: autofocus,
          readOnly: readOnly,
          showCursor: showCursor,
          validator: validator,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Get.isDarkMode
                      ? AppUi.colors.blueBacgroundOfDark
                      : AppUi.colors.blueBacground),
              borderRadius: BorderRadius.circular(20.h),
            ),
            focusedBorder: isSearch
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.isDarkMode
                            ? AppUi.colors.blueBacgroundOfDark
                            : AppUi.colors.blueBacground),
                    borderRadius: BorderRadius.circular(20.h),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.isDarkMode
                            ? AppUi.colors.blueOfDark
                            : AppUi.colors.blue),
                    borderRadius: BorderRadius.circular(20.h),
                  ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[100]),
              borderRadius: BorderRadius.circular(20.h),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[100]),
              borderRadius: BorderRadius.circular(20.h),
            ),
            fillColor: Get.isDarkMode
                ? AppUi.colors.blueBacgroundOfDark
                : AppUi.colors.blueBacground,
          ),
        );
}
