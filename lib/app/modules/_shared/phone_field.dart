import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    Key key,
    @required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CountryCodePicker(
              onChanged: print,
              showDropDownButton: true,
              initialSelection: Get.deviceLocale.countryCode,
              favorite: ["EG"],
              comparator: (a, b) => b.name.compareTo(a.name),
              onInit: (code) =>
                  print("on init ${code.name} ${code.dialCode} ${code.name}"),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUi.colors.blueBacground),
            borderRadius: BorderRadius.circular(20.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUi.colors.blue),
            borderRadius: BorderRadius.circular(20.h),
          ),
          fillColor: AppUi.colors.blueBacground,
        ),
      ),
    );
  }
}
