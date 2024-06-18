import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';

class AuthComponent {
  Widget defaultFormField({
     TextEditingController? controller,
    required IconData prefix,
    required String labelText,
    required Function validate,
    required TextInputType type,

    bool isClicked = true,
    bool isPassword = false,
    Function? suffixPressed,
    IconData? suffix,
    Function? onChange,
    var formKey,
  }) =>
      TextFormField(
        enabled: isClicked,
        obscureText: isPassword,
        keyboardType: type,
        decoration: InputDecoration(
          errorMaxLines: 4,
          labelText: labelText,
          errorStyle: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
            fontFamily: 'SourceSansPro',
            fontSize: 18,
          ),

          labelStyle: const TextStyle(
            color: AppConstance.whiteColor,
          ),
          prefixIcon: Icon(
            prefix,
            color: AppConstance.whiteColor,
          ),

          ///UnderlineInputBorder is line under the field
          enabledBorder: const UnderlineInputBorder(

            ///color of line
            borderSide: BorderSide(color: AppConstance.whiteColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppConstance.whiteColor),
          ),

          ///Error Border of the field
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          suffixIcon: suffix != null
              ? IconButton(
            icon: Icon(
              suffix,
              color: AppConstance.whiteColor,
            ),
            onPressed: () {
               suffixPressed!();
            },
          )
              : null,
        ),
        validator: (value) {
          return validate(value);
        },
        controller: controller,
        key: formKey,
      );

  Widget verifyFormField({
    required TextEditingController controller,
    required Function validate,
    required BuildContext context,
  }) =>
      SizedBox(
        height: 68,
        width: 55,
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            controller.text = value;
          },
          validator:  (value) {
            return validate(value);
          },
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderSide: BorderSide(color:AppConstance.whiteColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstance.whiteColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstance.whiteColor),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          onSaved: (pin1) {},
        ),
      );

  Widget upperComponent({
    required Size diSize
  }) => Row(
        children: [
          Container(
            color: AppConstance.appColor,
            height: diSize.height,
            width: diSize.width * .3,
          ),
          Container(
            color: AppConstance.whiteColor,
            height: diSize.height, width: diSize.width * .7,
          ),
        ],
      );

  Widget logoStyleComponent({
  required Size diSize
  })=>Container(
    decoration: const BoxDecoration(
      color: AppConstance.whiteColor,
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(75)),
    ),
    height: diSize.height * .3,
    width: diSize.width,
    child:  Image.asset("assets/images/ourLogo.jpg"),
  );


}





