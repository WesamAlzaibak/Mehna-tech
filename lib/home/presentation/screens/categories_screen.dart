import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/home/presentation/components/categories_component.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        // )..add(GetCategoriesEvent(context: context)
    child:const Scaffold(
      backgroundColor: AppConstance.whiteColor,
      body: CategoriesComponent(),
    ),
    );
  }
}