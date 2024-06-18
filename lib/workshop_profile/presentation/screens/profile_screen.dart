import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/dummy.dart';
import 'package:mehna_tech/workshop_profile/presentation/components/profile_appbar_component.dart';
import 'package:mehna_tech/workshop_profile/presentation/components/upper_workshop_profile_component.dart';
import 'package:mehna_tech/workshop_profile/presentation/components/workshop_small_posts_component.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_bloc.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_event.dart';

class WorkshopProfileScreen extends StatelessWidget {
  final int workshopId;
  final String workshopName;
  final bool isFollowed;
  const WorkshopProfileScreen({Key? key, required this.workshopId, required this.workshopName, required this.isFollowed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return BlocProvider(
          create: (context) => sl<WorkshopProfileBloc>()..add(PutFollowBottomValueEvent(isWorkshopFollowed: isFollowed)),
         child: Scaffold(
           backgroundColor: AppConstance.whiteColor,
           appBar: AppBar(
             backgroundColor: AppConstance.appColor,
             title: WorkshopProfileAppBarComponent(workshopName: workshopName,),
           ),
           body: ListView(
             padding: EdgeInsets.zero,
             children: <Widget>[
               UpperWorkshopProfileComponent(profile: workshopProfileInformation,),
               const SizedBox(
                   height: 15
               ),
               WorkshopSmallPostsComponent(diSize: diSize),
             ],
           ),
         ),
    );
  }
}