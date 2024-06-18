import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/search/presentation/components/search_text_component.dart';
import 'package:mehna_tech/search/presentation/screens/workshops_search_screen.dart';

// ignore: must_be_immutable
class SearchAppBarComponent extends StatelessWidget {
  SearchAppBarComponent({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppConstance().defaultFormField(
      controller: searchController,
      type: TextInputType.text,
      labelText: getLang(context, "search"),
      suffix: Icons.search,
      suffixPressed: () {
        if (searchController.text.isNotEmpty) {
          AppConstance().navigateTo(context, WorkshopsSearchScreen(
            x: 2,
            typeWord: searchController.text,
            categoryId: -1,
          ),
          );
        }
        }, height: 45,
    );
  }
}