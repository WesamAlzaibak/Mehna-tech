import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';

class WorkshopInformationComponent extends StatelessWidget {
  final WorkshopProfile profile;
  final Size diSize;
  const WorkshopInformationComponent({Key? key, required this.profile, required this.diSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      SizedBox(
        height: 100, width: diSize.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                profile.picture,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${profile.workshopPosts.length}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppConstance.blackColor,
                    ),
                  ),
                  Text(
                    getLang(context, "posts"),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppConstance.blackColor,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profile.followers,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppConstance.blackColor,
                    ),
                  ),
                  Text(
                    getLang(context, "followers"),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppConstance.blackColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: diSize.width - 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              profile.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: AppConstance.blackColor,
              ),
            ),
            Text(
              profile.description,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: AppConstance.blackColor,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
          height: 15
      ),
      ],
    );
  }
}