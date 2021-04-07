import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stainless_v2/app/modules/_shared/app_field.dart';
import 'package:stainless_v2/app/modules/clients/controllers/clients_controller.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class SearchField extends AppField {
  SearchField(context, ClientsController controller)
      : super(
            prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Icon(
                  Icons.search_rounded,
                  color: Get.isDarkMode
                      ? AppUi.colors.blueOfDark
                      : AppUi.colors.blue,
                )),
            controller: controller.search,
            focusNode: controller.searchFocusNode,
            onChanged: (_) => controller.startSearch(controller.clients),
            hintText: S.current.search,
            suffixIcon: controller.focus.value
                ? IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Get.isDarkMode
                          ? AppUi.colors.blueOfDark
                          : AppUi.colors.blue,
                    ),
                    onPressed: () => controller.endSearch())
                : Container());
}
