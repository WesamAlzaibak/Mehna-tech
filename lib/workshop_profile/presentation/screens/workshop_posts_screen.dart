import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_bloc.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_event.dart';

class WorkshopPostsScreen extends StatelessWidget {
  final List<Post> postList;
  final bool isFollowed;
  WorkshopPostsScreen({
    Key? key,
    required this.postList,
    required this.isFollowed,
  }) : super(key: key);

  final DateTime postDateTime = DateTime.now().subtract(const Duration(hours: 2));

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat.yMMMd().add_jm().format(postDateTime);
    return BlocProvider(
      create: (context) => sl<WorkshopProfileBloc>()
        ..add(PutFollowBottomValueEvent(isWorkshopFollowed: isFollowed)),
      child: Scaffold(
        backgroundColor: AppConstance.appColor,
        appBar: AppBar(
          backgroundColor: AppConstance.appColor,
          title: Text(
            getLang(context, "the_posts"),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: AppConstance.blackColor,
            ),
          ),
          actions: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: context.watch<WorkshopProfileBloc>().state.isFollowed
                  ? Container()
                  : TextButton(
                key: ValueKey<bool>(context.watch<WorkshopProfileBloc>().state.isFollowed),
                onPressed: () {
                  BlocProvider.of<WorkshopProfileBloc>(context).add(
                    ToggleFollowBottomEvent(),
                  );
                },
                child: Text(
                  getLang(context, "follow"),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: postList.length,
          itemBuilder: (context, index) {
              return AppConstance().postComponent(
                post: postList[index],
                formattedTime: formattedTime,
                context: context,
              );
            }
        ),
      ),
    );
  }
}
