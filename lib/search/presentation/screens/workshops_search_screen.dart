import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/dummy.dart';
import 'package:mehna_tech/search/presentation/components/search_appbar.dart';
import 'package:mehna_tech/search/presentation/components/search_result_component.dart';
import 'package:mehna_tech/search/presentation/components/search_word_component.dart';
import 'package:mehna_tech/search/presentation/controller/search_bloc.dart';

// ignore: must_be_immutable
class WorkshopsSearchScreen extends StatelessWidget {

  final int x;
  final String typeWord;
  final int categoryId;
  WorkshopsSearchScreen({Key? key, required this.x, required this.typeWord,required this.categoryId}): super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return BlocProvider(
        create: (BuildContext context) {
          final searchBloc = sl<SearchBloc>();
          //when having backEnd just do un comment
          // if (x == 1) {
          //   searchBloc.add(GetCategoryWorkshopsEvent(categoryId: categoryId, context: context));
          // } else {
          //   searchBloc.add(GetSearchResultEvent(context: context, search: typeWord));
          // }
          return searchBloc;
        },
        child: Scaffold(
          appBar: AppBar(
        backgroundColor: AppConstance.whiteColor,
        title: SearchAppBarComponent(),
      ),
          body: ListView.builder(
            itemCount: searchByCategoryList.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    SearchWordComponent(word: typeWord),
                    SearchResultComponent(search: searchByCategoryList[0],
                    ),
                  ],
                );
              }
              else {
                return  SearchResultComponent(
                  search: searchByCategoryList[index],
                );
              }
            },
          ),
        ),
      );
  }
}