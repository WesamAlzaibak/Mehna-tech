import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mehna_tech/auth/data/models/login_model.dart';
import 'package:mehna_tech/auth/domain/useCases/post_forget_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_login.dart';
import 'package:mehna_tech/auth/domain/useCases/post_register.dart';
import 'package:mehna_tech/auth/domain/useCases/post_reset_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_verify_code.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/auth/presentation/screens/login_screen.dart';
import 'package:mehna_tech/auth/presentation/screens/register_screen.dart';
import 'package:mehna_tech/auth/presentation/screens/verify_screen.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/network/error_message_model.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';


abstract class BaseAuthRemoteDataSource{
  Future postLogin(LoginParameters parameters);
  Future postRegister(RegisterParameters parameters);
  Future postVerifyCode(VerifyParameters parameters);
  Future postResetPassword(ResetParameters parameters);
  Future postForgetPassword(ForgetParameters parameters);
}
class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<void> postLogin(LoginParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.loginURL),
        headers: AppConstance.sendHeaders,
        body: {
          "email": parameters.email,
          "password": parameters.password,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
       // AppConstance.tokenHeaders = mapValue["access_token"];
            // ignore: use_build_context_synchronously
            Navigator.push(parameters.context, MaterialPageRoute(builder: (context)=>registerScreen()));
            LoginModel.fromJson(mapValue);
        }
      else {
        if (response.statusCode == 422) {
          showDialog(
            context: parameters.context,
            builder: (context) => AppConstance().myDialogSingleButton(
              context: context,
              sendMessage: "${getLang(context,"not_verified_response")}",
              ok: true,
              nextScreen: verificationScreen(email: parameters.email,),
            ),
          );
        } else {
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
        }
    } catch (error) {
        throw const ServerException(errorModel: ErrorModel(errorMessage: "Server went wrong", success: false));
    }
  }

  @override
  Future<void> postRegister(RegisterParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.registerCustomerURL),
        body: {
          "first_name" : parameters.firstName,
          "last_name" : parameters.lastName,
          "email": parameters.email,
          "password": parameters.password,
          "password_confirmation" : parameters.confirmPassword,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(parameters.context, MaterialPageRoute(builder: (context)=>registerScreen()));
      }
      else {
          showDialog(
            context: parameters.context,
            builder: (context) => AppConstance().myDialogSingleButton(
              context: context,
              sendMessage: responseMessage(mapValue["message"],context),
              ok: true,
              nextScreen: verificationScreen(email: parameters.email,),
            ),
          );
        }
    } catch (error) {
        throw const ServerException(errorModel: ErrorModel(errorMessage: "Server went wrong", success: false));
    }
  }

  @override
  Future<void> postVerifyCode(VerifyParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.verifyEmailURL),
        body: {
          "email" : parameters.email,
          "code" : parameters.code,
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(parameters.context, MaterialPageRoute(builder: (context)=>loginScreen()));
      }
      else {
        showDialog(
          context: parameters.context,
          builder: (context) => AppConstance().myDialogSingleButton(
            context: context,
            ok: false,
            sendMessage: responseMessage(mapValue["message"],context),
          ),
        );
      }
    } catch (error) {
      throw const ServerException(errorModel: ErrorModel(errorMessage: "Network error", success: false));
    }
  }

  @override
  Future<void> postResetPassword(ResetParameters parameters) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstance.verifyEmailURL),
        body: {
          "code" : parameters.code,
          "password": parameters.password,
          "confirmPassword": parameters.confirmPassword
        },
      );
      final Map<String, dynamic> mapValue = json.decode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(parameters.context, MaterialPageRoute(builder: (context)=>registerScreen()));
      }
      else {
        showDialog(
          context: parameters.context,
          builder: (context) => AppConstance().myDialogSingleButton(
            context: context,
            ok: false,
            sendMessage: responseMessage(mapValue["message"],context),
          ),
        );
      }
    } catch (error) {
      throw const ServerException(errorModel: ErrorModel(errorMessage: "Network error", success: false));
    }
  }

  @override
  Future<void> postForgetPassword(ForgetParameters parameters) async {
    try {
      await http.post(
        Uri.parse(AppConstance.forgetPasswordURL),
        body: {
          "email" : parameters.email,
        },
      );
    } catch (error) {
      throw const ServerException(errorModel: ErrorModel(errorMessage: "Network error", success: false));
    }
  }
}