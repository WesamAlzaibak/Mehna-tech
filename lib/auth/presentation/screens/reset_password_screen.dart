import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/presentation/components/auth_component.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_event.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_state.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

// ignore: camel_case_types, must_be_immutable
class resetPasswordScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController pinController1 = TextEditingController();
  TextEditingController pinController2 = TextEditingController();
  TextEditingController pinController3 = TextEditingController();
  TextEditingController pinController4 = TextEditingController();
  TextEditingController pinController5 = TextEditingController();
  TextEditingController pinController6 = TextEditingController();
  bool isPassword1 = true;
  bool isPassword2 = true;
  String combinedValue = "";
  var formKey = GlobalKey<FormState>();
  final String email;

  resetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    print(email);
    return  BlocProvider(
        create: (context) => sl<ResetPasswordBloc>()..add(PostForgetPasswordEvent(email)),
    child:  Scaffold(
    body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
    buildWhen: (previous  , current) =>
    previous.forgetPasswordState !=  current.forgetPasswordState,
    builder: (context , state) {
      return  SingleChildScrollView(
        child: Stack(
          children: [
            AuthComponent().upperComponent(diSize: diSize),
            Column(
              children: [
                AuthComponent().logoStyleComponent(diSize: diSize),
                Container(
                  decoration: const  BoxDecoration(
                    color: AppConstance.appColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                  ),
                  height: diSize.height * .7,
                  width: diSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      SizedBox(
                        width: diSize.width * .7,
                        height: 70,
                        child: Center(
                          child: Text(
                            "${getLang(context, "new_password_message")}",
                            style:const TextStyle(
                              color: AppConstance.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AuthComponent().verifyFormField(controller: pinController1, context: context, validate: (value)=>validateEmpty(value,context,2)),
                                      AuthComponent().verifyFormField(controller: pinController2, context: context, validate: (value)=>validateEmpty(value,context,2)),
                                      AuthComponent().verifyFormField(controller: pinController3, context: context, validate: (value)=>validateEmpty(value,context,2)),
                                      AuthComponent().verifyFormField(controller: pinController4, context: context, validate: (value)=>validateEmpty(value,context,2)),
                                      AuthComponent().verifyFormField(controller: pinController5, context: context, validate: (value)=>validateEmpty(value,context,2)),
                                      AuthComponent().verifyFormField(controller: pinController6, context: context, validate: (value)=>validateEmpty(value,context,2)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                Container(
                                  margin: const EdgeInsets.only(left: 35, right: 35),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AuthComponent().defaultFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        labelText: "${getLang(context, "password")}",
                                        validate: (value) =>
                                            validatePassword(value,context),
                                        prefix: Icons.lock,
                                        suffix: context.watch<ResetPasswordBloc>().state.isPasswordVisible1?Icons.visibility:Icons.visibility_off,
                                        isPassword: !context.watch<ResetPasswordBloc>().state.isPasswordVisible1,
                                        suffixPressed: () {
                                          BlocProvider.of<ResetPasswordBloc>(context).add(TogglePasswordVisibilityEvent1());
                                        },
                                      ),
                                      const SizedBox(height: 30,),
                                      AuthComponent().defaultFormField(
                                        controller: confirmController,
                                        type: TextInputType.visiblePassword,
                                        labelText: "${getLang(context, "confirm_password")}",
                                        validate: (value) =>
                                            validateConfirm(value,passwordController.text,context),
                                        prefix: Icons.lock,
                                        suffix: context.watch<ResetPasswordBloc>().state.isPasswordVisible2?Icons.visibility:Icons.visibility_off,
                                        isPassword: !context.watch<ResetPasswordBloc>().state.isPasswordVisible2,
                                        suffixPressed: () {
                                          BlocProvider.of<ResetPasswordBloc>(context).add(TogglePasswordVisibilityEvent2());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {Navigator.pop(context);},
                            child: Text(
                              "${getLang(context, "resend_code")}",
                              textAlign: TextAlign.left,
                              style:const TextStyle(
                                  decoration:
                                  TextDecoration.underline,
                                  color:AppConstance.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppConstance.whiteColor,
                            child: Builder( // Use Builder to get a new context
                              builder: (innerContext) => IconButton(
                                color: AppConstance.appColor,
                                onPressed: () async {
                                  combinedValue = pinController1.text+pinController2.text+pinController3.text+
                                      pinController4.text+pinController5.text+pinController6.text;
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<ResetPasswordBloc>(innerContext).add(
                                      PostResetPasswordEvent(code: combinedValue,password: passwordController.text,confirmPassword: passwordController.text, context: context),
                                    );
                                  }
                                },
                                icon:const Icon(
                                  Icons.chevron_right,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
          }
        )
       )
    );
  }
}


