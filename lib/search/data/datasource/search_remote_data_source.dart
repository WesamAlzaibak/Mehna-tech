import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/network/error_message_model.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/search/data/models/search_model.dart';
import 'package:mehna_tech/search/domain/useCases/get_category_workshops.dart';
import 'package:mehna_tech/search/domain/useCases/get_search_result.dart';

abstract class BaseSearchRemoteDataSource{
  Future getCategoryWorkshops(CategoryFilterParameters parameters);
  Future getSearchResult(SearchParameters parameters);
}
class SearchRemoteDataSource extends BaseSearchRemoteDataSource {

  @override
  Future<void> getCategoryWorkshops(CategoryFilterParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.categorySearchURL),
        headers: AppConstance.tokenHeaders,
        body: {
          "category_id": parameters.categoryId,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
        SearchModel.fromJson(mapValue);
      }
      else {
        showDialog(
          context: parameters.context,
          builder: (context) => AppConstance().myDialogSingleButton(
            context: context,
            sendMessage: responseMessage(mapValue["message"],context),
            ok: false,
          ),
        );
      }
    } catch (error) {
      throw const ServerException(errorModel: ErrorModel(errorMessage: "Server went wrong", success: false));
    }
  }

  @override
  Future<void> getSearchResult(SearchParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.categorySearchURL),
        headers: AppConstance.tokenHeaders,
        body: {
          "search": parameters.search,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
        SearchModel.fromJson(mapValue);
      }
      else {
        showDialog(
          context: parameters.context,
          builder: (context) => AppConstance().myDialogSingleButton(
            context: context,
            sendMessage: responseMessage(mapValue["message"],context),
            ok: false,
          ),
        );
      }
    } catch (error) {
      throw const ServerException(errorModel: ErrorModel(errorMessage: "Server went wrong", success: false));
    }
  }

}