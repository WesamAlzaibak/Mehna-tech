import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/order/presentation/controller/order_bloc.dart';
import 'package:mehna_tech/order/presentation/controller/order_event.dart';
import 'package:mehna_tech/order/presentation/controller/order_state.dart'; // Import ImagePicker


// ignore: must_be_immutable
class OrderDescriptionScreen extends StatelessWidget {
  OrderDescriptionScreen({Key? key}) : super(key: key);
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<OrderBloc>(),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppConstance.appColor,
              title: const Text(
                "Order description",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppConstance.blackColor,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AppConstance().defaultFormField(
                    controller: descriptionController,
                    type: TextInputType.text,
                    labelText: "what is the problem",
                    maxLength: 400,
                  ),
                  SizedBox(
                    width: diSize.width * 0.8,
                    child: const Text(
                      "Choose the Images that Explain the Problem",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: AppConstance.blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppConstance().defaultBottom(
                    function: () async {
                      final images = await _selectImages(context);
                      if (images != null) {
                        context.read<OrderBloc>().add(
                          ChoosePhotosListEvent(files: images),
                        );
                      }
                    },
                    text: "Choose Images",
                    backgroundColor: AppConstance.appColor,
                    textColor: AppConstance.whiteColor,
                    radius: 25,
                  ),
                  if (state.files != null)
                    Column(
                      children: state.files!
                          .map((image) => Image.file(File(image.path)))
                          .toList(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<List<XFile>?> _selectImages(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    return images;
  }
}
