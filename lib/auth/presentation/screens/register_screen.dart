import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/presentation/components/auth_component.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/auth/presentation/controller/register_controller/register_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/register_controller/register_event.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

// ignore: camel_case_types, must_be_immutable
class registerScreen extends StatelessWidget {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isPassword1 = true;
  bool isPassword2 = true;
  var formKey = GlobalKey<FormState>();
  registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return  BlocProvider(
        create: (context) => sl<RegisterBloc>(),
        child: Scaffold(
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                  ),
                  height: diSize.height ,
                  width: diSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10, top: 30),
                        child: Center(
                          child: Text(
                            "${getLang(context, "sign_up")}",
                            style:const TextStyle(
                                color: AppConstance.whiteColor,
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: diSize.height * 0.03,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 35, right: 35),
                              child: Column(
                                children: [
                                  AuthComponent().defaultFormField(
                                    controller: firstNameController,
                                    validate: (value)=>validateEmpty(value,context,1),
                                    prefix: Icons.person_sharp,
                                    labelText:  "${getLang(context, "first_name")}",
                                    type: TextInputType.name,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  AuthComponent().defaultFormField(
                                    controller: lastNameController,
                                    validate: (value)=>validateEmpty(value,context,1),
                                    prefix: Icons.person_sharp,
                                    labelText:  "${getLang(context, "last_name")}",
                                    type: TextInputType.name,),
                                  const SizedBox(height: 30,),
                                  AuthComponent().defaultFormField(
                                      controller: phoneController,
                                      prefix: Icons.phone,
                                      labelText:  "${getLang(context, "phone_number")}",
                                      validate: (value)=>validateNumber(value,context),
                                      type: TextInputType.phone),
                                  const SizedBox(height: 30,),
                                  AuthComponent().defaultFormField(
                                      controller: emailController,
                                      prefix: Icons.email,
                                      labelText:  "${getLang(context, "email_address")}",
                                      validate: (value)=>validateEmail(value,context),
                                      type: TextInputType.emailAddress),
                                  const SizedBox(height: 30,),
                                  AuthComponent().defaultFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    labelText:  "${getLang(context, "password")}",
                                    validate: (value) =>
                                        validatePassword(value,context),
                                    prefix: Icons.lock,
                                    suffix: context.watch<RegisterBloc>().state.isPasswordVisible1?Icons.visibility:Icons.visibility_off,
                                    isPassword: !context.watch<RegisterBloc>().state.isPasswordVisible1,
                                    suffixPressed: () {
                                      BlocProvider.of<RegisterBloc>(context).add(TogglePasswordVisibilityEvent1());
                                    },
                                  ),
                                  const SizedBox(height: 30,),
                                  AuthComponent().defaultFormField(
                                    controller: confirmPasswordController,
                                    type: TextInputType.visiblePassword,
                                    labelText: "${getLang(context, "confirm_password")}",
                                    validate: (value) =>
                                        validateConfirm(value,passwordController.text,context),
                                    prefix: Icons.lock,
                                    suffix: context.watch<RegisterBloc>().state.isPasswordVisible2?Icons.visibility:Icons.visibility_off,
                                    isPassword: !context.watch<RegisterBloc>().state.isPasswordVisible2,
                                    suffixPressed: () {
                                      BlocProvider.of<RegisterBloc>(context).add(TogglePasswordVisibilityEvent2());
                                    },
                                  ),
                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {Navigator.pop(context);},
                                        child: Text(
                                          "${getLang(context, "already_have_account")}",
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
                                              if (formKey.currentState!.validate()) {
                                                BlocProvider.of<RegisterBloc>(innerContext).add(
                                                  PostRegisterEvent(
                                                    firstName: firstNameController.text,
                                                    lastName: lastNameController.text,
                                                    email: emailController.text,
                                                    password: passwordController.text,
                                                    confirmPassword: passwordController.text,
                                                    phone: phoneController.text,
                                                    context: context,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]
          ),
        ),
      ),
    )
    );
  }
}
