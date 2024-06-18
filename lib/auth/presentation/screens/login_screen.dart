import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/presentation/components/auth_component.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/auth/presentation/controller/login_controller/login_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/login_controller/login_event.dart';
import 'package:mehna_tech/auth/presentation/screens/register_screen.dart';
import 'package:mehna_tech/auth/presentation/screens/reset_password_screen.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

// ignore: camel_case_types, must_be_immutable
class loginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  final emailFormFieldKey = GlobalKey<FormFieldState>();

  loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
      return BlocProvider(
           create: (context) => sl<LoginBloc>(),
           child:  Scaffold(
             body: SingleChildScrollView(
             child: Form(
          key: formKey,
          child: Stack(children: [
            AuthComponent().upperComponent(diSize: diSize),
            Column(
              children: [
                AuthComponent().logoStyleComponent(diSize: diSize),
                Container(
                  decoration:const BoxDecoration(
                    color: AppConstance.appColor,
                    borderRadius:  BorderRadius.only
                      (topLeft: Radius.circular(75)
                    ),
                  ),
                  height: diSize.height * 0.7,
                  width: diSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child:Center(
                            child: Text(
                              "${getLang(context,"login")}",
                              style:const TextStyle(
                                color:AppConstance.whiteColor,
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: diSize.height * 0.1),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: diSize.height / 60,
                                bottom: diSize.height / 20,
                                left: diSize.width * 0.1,
                                right: diSize.width * 0.1,
                              ),
                              child: Column(
                                children: [
                                  AuthComponent().defaultFormField(
                                      formKey: emailFormFieldKey,
                                      controller: emailController,
                                      prefix: Icons.email,
                                      labelText: "${getLang(context, "email_address")}",
                                      validate: (value)=>validateEmail(value,context),
                                      type: TextInputType.emailAddress),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  AuthComponent().defaultFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    labelText: "${getLang(context, "password")}",
                                    validate: (value) =>
                                        validatePassword(value,context),
                                    prefix: Icons.lock,
                                    suffix: context.watch<LoginBloc>().state.isPasswordVisible?Icons.visibility:Icons.visibility_off,
                                    isPassword: !context.watch<LoginBloc>().state.isPasswordVisible,
                                    suffixPressed: () {
                                      BlocProvider.of<LoginBloc>(context).add(TogglePasswordVisibilityEvent());
                                    },
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Builder(
                                        builder: (innerContext) =>
                                       TextButton(
                                          onPressed: () async{
                                              showDialog(
                                                context: context,
                                                builder: (context) => AppConstance().myDialogSingleButton(
                                                  context: context,
                                                  ok: true,
                                                  sendMessage: "${getLang(context, "we_send_code")}",
                                                  nextScreen: resetPasswordScreen(email: emailController.text),
                                                ),
                                              );
                                        },

                                          child:Text(
                                            "${getLang(context, "forget_password")}",
                                            style:const TextStyle(
                                              decoration:
                                              TextDecoration.underline,
                                              color: AppConstance.whiteColor,
                                              fontSize: 15,
                                            ),
                                          )
                                      ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          AppConstance().navigateTo(context, registerScreen());
                                        },
                                        child:Text(
                                          "${getLang(context, "sign_up")}",
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
                                        child: Builder(
                                          builder: (innerContext) => IconButton(
                                            color: AppConstance.appColor,
                                            onPressed: () async {
                                              if (formKey.currentState!.validate()) {
                                                BlocProvider.of<LoginBloc>(innerContext).add(
                                                  PostLoginEvent(
                                                    email: emailController.text,
                                                    password: passwordController.text,
                                                    context : context,
                                                  ),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
            ),
          ),
      );
  }
}