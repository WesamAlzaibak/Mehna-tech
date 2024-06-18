import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/home/presentation/components/home_posts_component.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';

class HomePostsScreen extends StatelessWidget {
  const HomePostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<HomeBloc>(),
      child: Scaffold(
        backgroundColor: AppConstance.appColor,
        body: HomePostsComponent(),
      ),
    );
  }
}