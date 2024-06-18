import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

class AdvertisementWordComponent extends StatelessWidget {

  const AdvertisementWordComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        color: Colors.grey[200],
        child: Center(
          child: Text(
            getLang(context, "Advertisements"),
            style:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppConstance.appColor,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
    );
  }
}