import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/presentation/components/auth_component.dart';
import 'package:mehna_tech/auth/presentation/components/functions.dart';
import 'package:mehna_tech/auth/presentation/controller/verify_code_controller/verify_code_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/verify_code_controller/verify_code_event.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

// ignore: camel_case_types, must_be_immutable
class verificationScreen extends StatelessWidget {
  TextEditingController pinController1 = TextEditingController();
  TextEditingController pinController2 = TextEditingController();
  TextEditingController pinController3 = TextEditingController();
  TextEditingController pinController4 = TextEditingController();
  TextEditingController pinController5 = TextEditingController();
  TextEditingController pinController6 = TextEditingController();
  String? combinedValue = "111111";
  var formKey = GlobalKey<FormState>();
  final String email;

  verificationScreen({Key? key, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<VerifyCodeBloc>(),
      child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              AuthComponent().upperComponent(diSize: diSize),
              Column(
                children: [
                  AuthComponent().logoStyleComponent(diSize: diSize),
                  Container(
                    decoration: const BoxDecoration(
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
                          height: 80,
                          child: Center(
                            child: Text(
                              "${getLang(context, "check_code_message")}",
                              style:const TextStyle(
                              color: AppConstance.whiteColor,
                              fontWeight: FontWeight.bold,
                             fontSize: 25,
                            ),
                           ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
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
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {Navigator.pop(context);},
                              child:Text(
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
                                      BlocProvider.of<VerifyCodeBloc>(innerContext).add(
                                        PostVerifyCodeEvent(
                                          code: combinedValue!,
                                          context: context, email: email,
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
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}