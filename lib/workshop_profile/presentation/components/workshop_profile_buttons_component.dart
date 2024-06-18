import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_bloc.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_event.dart';

class WorkshopProfileBottomsComponent extends StatelessWidget {
  const WorkshopProfileBottomsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            width: 190, height: 40,
            decoration: BoxDecoration(
              color: AppConstance.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                context.watch<WorkshopProfileBloc>().state.isFollowed ? "unFollow" : "follow",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppConstance.blackColor,
                ),
              ),
            ),
          ),
          onTap: () {
            BlocProvider.of<WorkshopProfileBloc>(context).add(
                ToggleFollowBottomEvent());
            // BlocProvider.of<WorkshopProfileBloc>(context).add(
            //     PostFollowProfileEvent(workshopId: profile.workshopId, context: context));
          },
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: Container(
            width: 190, height: 40,
            decoration: BoxDecoration(
              color: AppConstance.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "make order",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppConstance.blackColor,
                ),
              ),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
