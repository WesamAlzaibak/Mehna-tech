import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/home/presentation/components/drawer_component.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';
import 'package:mehna_tech/home/presentation/controller/home_events.dart';
import 'package:mehna_tech/home/presentation/controller/home_state.dart';
import 'package:mehna_tech/home/presentation/screens/categories_screen.dart';
import 'package:mehna_tech/home/presentation/screens/home_posts_screen.dart';

// ignore: camel_case_types, must_be_immutable
class homeScreen extends StatelessWidget {

  const homeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child:  Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous  , current) =>
          previous.homePostsState !=  current.homePostsState,
          builder: (context , state) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppConstance.appColor,
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: AppConstance.whiteColor,
                        child: Material(color: AppConstance.appColor,
                          child: IconButton(
                            onPressed: (){},
                            icon:const Icon(
                              Icons.notifications_active_sharp,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              drawer: const DrawerComponent(),
              extendBody: true,
              bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return CurvedNavigationBar(
                    height: 50,
                    color: AppConstance.appColor,
                    backgroundColor: Colors.transparent,
                    index: state.currentIndex,
                    items: const <Widget>[
                      Icon(Icons.home, size: 40, color: AppConstance.whiteColor),
                      Icon(Icons.handyman, size: 40, color: AppConstance.whiteColor),
                    ],
                    onTap: (index) {
                      BlocProvider.of<HomeBloc>(context).add(ToggleCurrentIndexNumberEvent(newCurrentIndex: index));
                    },
                  );
                },
              ),
              body: context.watch<HomeBloc>().state.currentIndex==0?const HomePostsScreen():const CategoriesScreen(),
            );
          }
        )
      )
    );
  }
}