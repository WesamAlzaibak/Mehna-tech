import 'package:flutter/cupertino.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

String? validatePassword(String value,BuildContext context)
{
  if (value.isEmpty) {
    return "${getLang(context, "field_required")}";
  } else if (value.length < 8) {
    return "${getLang(context, "validate_password")}";
  }
  return null;
}

String? validateConfirm(String value,String value2,BuildContext context)
{
  if(value!=value2) {
    return "${getLang(context, "validate_confirm")}";
  }
     return null;
}

String? convertToTitleCase(String text) {
  if(text.isEmpty) {
    return null;
  } else {
    return text.toUpperCase();
  }
}

String? validateEmail(String value,BuildContext context)
{
  if(value.isEmpty) {
    return "${getLang(context, "field_required")}";
  }
  if(!value.contains("@gmail.com")){
    return "${getLang(context, "validate_email")}";
  }
  return null;
}

String? validateNumber(String value,BuildContext context)
{
  if(value.length!=10) {
    return "${getLang(context, "validate_number=10")}";
  }
  if(!value.startsWith("09")){
    return "${getLang(context, "validate_number_09")}";
  }
  return null;
}

String? validateEmpty(String value,BuildContext context,int x)
{
  if(value.isEmpty&&x==1) {
    return "${getLang(context, "field_required")}";
  }
  else if(value.isEmpty&&x==2){
    return "${getLang(context, "small_field_required")}";
  }
  return null;
}

String responseMessage(String message,BuildContext context)
{
  String a = "wrong password or email, please check your inputs again";
  String b = "The verification code you entered is incorrect. Please verify the code and try again.";
  String c = "The email has already been taken.";
  String d = "Too many unsuccessful attempts, please try again later or contact support.";
  var result = a.compareTo(message);
  if(result==0)
  {return "${getLang(context,"not_verified_response")}";}
  else{
    result = b.compareTo(message);
    if(result==0)
    {
      return "${getLang(context,"wrong_code_response")}";
    }
    else{
      result =c.compareTo(message);
      if(result==0)
      {
        return "${getLang(context,"email_taken_response")}";
      }
      else{
        result = d.compareTo(message);
        if(result==0)
        {
          return "${getLang(context,"too_many_attempts_response")}";
        }
        else {return "${getLang(context,"something_wrong_response")}";}
      }
    }
  }
}