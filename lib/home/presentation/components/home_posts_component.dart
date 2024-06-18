import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/dummy.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/home/presentation/components/advertisement_component.dart';
import 'package:mehna_tech/home/presentation/components/advertisement_word_component.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';
import 'package:mehna_tech/home/presentation/controller/home_state.dart';

class HomePostsComponent extends StatelessWidget {
  final DateTime postDateTime = DateTime.now().subtract(const Duration(hours: 2));

  HomePostsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat.yMMMd().add_jm().format(postDateTime);
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
      previous.homePostsState != current.homePostsState,
      builder: (context, state) {
        switch (state.homePostsState) {
          case RequestState.loading:
            return Container(
              color: Colors.grey[300],
              height: 200,
              child: const Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [
                      const AdvertisementWordComponent(),
                      const AdvertisementComponent(),
                      AppConstance().postComponent(post: postsList[0], formattedTime: formattedTime, context: context),
                    ],
                  );
                }
                else {
                  return AppConstance().postComponent(
                    post: postsList[index],
                    formattedTime: formattedTime,
                    context: context,
                  );
                }
              }
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(
                child: Text(
                  state.promotePostsMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}