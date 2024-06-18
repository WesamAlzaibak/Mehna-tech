import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/network/error_message_model.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/order/data/models/city_model.dart';
import 'package:mehna_tech/order/data/models/place_model.dart';
import 'package:mehna_tech/order/data/models/service_model.dart';
import 'package:mehna_tech/order/domain/useCases/get_places.dart';
import 'package:mehna_tech/order/domain/useCases/get_services.dart';
import 'package:mehna_tech/order/domain/useCases/post_order.dart';

abstract class BaseOrderRemoteDataSource{
  Future postOrder(OrderParameters parameters);
  Future getServices(ServicesParameters parameters);
  Future getCities(ContextParameters parameters);
  Future getPlaces(PlacesParameters parameters);
}
class OrderRemoteDataSource extends BaseOrderRemoteDataSource {

  @override
  Future<void> postOrder(OrderParameters parameters) async {
    try {
      final response = await Dio().post(
        AppConstance.orderURL,
        data: AppConstance.sendHeaders,
        queryParameters: {
          "workshopId": parameters.workshopId,
          "categoryId": parameters.categoryId,
          "order_services": parameters.servicesIds,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.data);
      if (response.statusCode == 200) {
        showDialog(
          context: parameters.context,
          builder: (context) => AppConstance().myDialogSingleButton(
            context: context,
            sendMessage: "${getLang(context,mapValue["message"])}",
            ok: false,
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(parameters.context);
        // ignore: use_build_context_synchronously
        Navigator.pop(parameters.context);
        // ignore: use_build_context_synchronously
        Navigator.pop(parameters.context);
      }
      else {
          showDialog(
            context: parameters.context,
            builder: (context) =>
                AppConstance().myDialogSingleButton(
                  context: context,
                  ok: false,
                  sendMessage: responseMessage(mapValue["message"],context),
                ),
          );
      }
    } catch (error) {
      throw const ServerException(errorModel: ErrorModel(errorMessage: "Server went wrong", success: false));
    }
  }

  @override
  Future<List<ServicesModel>> getServices(ServicesParameters parameters)async{
    final response = await Dio().get(
        AppConstance.servicesURL,
        queryParameters: {"category_id": parameters.categoryId},
        options: Options(headers: AppConstance.tokenHeaders)
    );
    if (response.statusCode == 200) {
      return List<ServicesModel>.from((response.data as List).map((e)
      => ServicesModel.fromJson(e)
      ));
    }
    else {
      throw ServerException(errorModel : ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<CityModel>> getCities(ContextParameters parameters)async{
    final response = await Dio().get(
        AppConstance.citiesURL,
        options: Options(headers: AppConstance.tokenHeaders)
    );
    if (response.statusCode == 200) {
      return List<CityModel>.from((response.data as List).map((e)
      => CityModel.fromJson(e)
      ));
    }
    else {
      throw ServerException(errorModel : ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<PlaceModel>> getPlaces(PlacesParameters parameters)async{
    final response = await Dio().get(
        AppConstance.placesURL,
        queryParameters: {"city_id": parameters.cityId},
        options: Options(headers: AppConstance.tokenHeaders)
    );
    if (response.statusCode == 200) {
      return List<PlaceModel>.from((response.data as List).map((e)
      => PlaceModel.fromJson(e)
      ));
    }
    else {
      throw ServerException(errorModel : ErrorModel.fromJson(response.data));
    }
  }
}