import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';

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
      child: AppField(
        controller: _controller,
        keyboardType: TextInputType.phone,
        autofocus: false,
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
      ),
    ).labeledField(context, S.current.phone_number);
  }
}
