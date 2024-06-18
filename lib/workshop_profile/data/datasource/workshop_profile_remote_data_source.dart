import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mehna_tech/auth/data/models/no_entities_model.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/network/error_message_model.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/home/data/models/post_model.dart';
import 'package:mehna_tech/workshop_profile/data/models/workshop_profile_model.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/post_follow_workshop.dart';

abstract class BaseWorkshopProfileRemoteDataSource{

  Future<WorkshopProfileModel> getWorkshopProfile(WorkshopProfileParameters parameters);
  Future<List<PostModel>> getWorkshopPosts(WorkshopProfileParameters parameters);
  Future postFollowWorkshop(FollowWorkshopParameters parameters);

}

class WorkshopProfileRemoteDataSource extends BaseWorkshopProfileRemoteDataSource {

  @override
  Future<WorkshopProfileModel> getWorkshopProfile(WorkshopProfileParameters parameters)async{
    final response = await Dio().get(
        AppConstance.workshopProfileURL,
        queryParameters: {"workshop_id": parameters.workshopId},
        options: Options(headers: AppConstance.tokenHeaders)
    );
    if (response.statusCode == 200) {
      return WorkshopProfileModel.fromJson((response.data));
    }
    else {
      throw ServerException(errorModel : ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<PostModel>> getWorkshopPosts(WorkshopProfileParameters parameters)async{
      final response = await Dio().get(
          AppConstance.workshopProfileURL,
          queryParameters: {"workshop_id": parameters.workshopId},
          options: Options(headers: AppConstance.tokenHeaders)
      );
      if (response.statusCode == 200) {
       return List<PostModel>.from((response.data as List).map((e)
        => PostModel.fromJson(e)
        ));
      }
      else {
        throw ServerException(errorModel : ErrorModel.fromJson(response.data));
      }
    }

  @override
  Future<void> postFollowWorkshop(FollowWorkshopParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.followWorkshopURL),
        headers: AppConstance.sendHeaders,
        body: {
          "workshop_id": parameters.workshopId,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
        NoEntitiesModel.fromJson(mapValue);
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