import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';

class WorkshopProfileAppBarComponent extends StatelessWidget {
  final String workshopName;
  const WorkshopProfileAppBarComponent({Key? key, required this.workshopName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      workshopName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: AppConstance.blackColor,
      ),
    );
  }
}
