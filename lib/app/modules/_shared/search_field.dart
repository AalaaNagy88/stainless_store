import 'package:flutter/material.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/app_ui.dart';

class SearchField extends TextField {
  SearchField(context)
      : super(
          readOnly: true,
          showCursor: false,
          onTap: () => showSearch(context: context, delegate: Search()),
          decoration: InputDecoration(
            hintText: S.current.search,
            filled: true,
            prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Icon(
                  Icons.search_rounded,
                  color: AppUi.colors.blue,
                )),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppUi.colors.blueBacground),
              borderRadius: BorderRadius.circular(20.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppUi.colors.blueBacground),
              borderRadius: BorderRadius.circular(20.h),
            ),
            fillColor: AppUi.colors.blueBacground,
          ),
        );
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
