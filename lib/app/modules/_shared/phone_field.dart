import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final Rx<CountryCode> selectedCode;

  const PhoneField({Key key, this.controller, this.selectedCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppField(
        controller: controller,
        keyboardType: TextInputType.phone,
        autofocus: false,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CountryCodePicker(
            onChanged: (code) => selectedCode.value = code,
            showDropDownButton: true,
            initialSelection: Get.deviceLocale.countryCode,
            favorite: ["EG"],
            onInit: (code) => selectedCode.value = code,
          ),
        ),
      ),
    ).labeledField(context, S.current.phone_number);
  }
}
