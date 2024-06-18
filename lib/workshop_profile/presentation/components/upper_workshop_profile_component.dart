import 'package:flutter/material.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';
import 'package:mehna_tech/workshop_profile/presentation/components/workshop_information_component.dart';
import 'package:mehna_tech/workshop_profile/presentation/components/workshop_profile_buttons_component.dart';

class UpperWorkshopProfileComponent extends StatelessWidget {
  final WorkshopProfile profile;
  const UpperWorkshopProfileComponent({Key? key, required this.profile,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkshopInformationComponent(profile: profile, diSize: diSize,),
          const WorkshopProfileBottomsComponent(),
        ],
      ),
    );
  }
}