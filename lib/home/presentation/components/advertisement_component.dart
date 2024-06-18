import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/dummy.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';
import 'package:mehna_tech/home/presentation/controller/home_state.dart';

class AdvertisementComponent extends StatelessWidget {
  const AdvertisementComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
      previous.promotePostsState != current.promotePostsState,
      builder: (context, state) {
        switch (state.promotePostsState) {
          case RequestState.loading:
            return SliverToBoxAdapter(
              child: Container(
                color: Colors.grey[300],
                height: 200,
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    disableCenter: true,
                    onPageChanged: (index, reason) {},
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: advertisementList.map(
                        (item) {
                      return CachedNetworkImage(
                        height: 350.0,
                        imageUrl: item.image,
                        fit: BoxFit.cover,
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    state.promotePostsMessage,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            );
          default:
            return const SliverToBoxAdapter(); // Handle other cases as needed
        }
      },
    );
  }
}