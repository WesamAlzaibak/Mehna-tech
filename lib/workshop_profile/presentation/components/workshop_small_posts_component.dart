import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/dummy.dart';

class WorkshopSmallPostsComponent extends StatelessWidget {
  final Size diSize;
  const WorkshopSmallPostsComponent({Key? key, required this.diSize,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      primary: false,
      children: List.generate(postsList.length,(index){
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: SizedBox(
            width: diSize.width * 0.3, height: diSize.width * 0.35,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CachedNetworkImage(
                  imageUrl: postsList[index].postImages[0],
                ),
                const Icon(
                  Icons.photo_library,
                  size: 20,
                  color: AppConstance.whiteColor,
                )
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}
