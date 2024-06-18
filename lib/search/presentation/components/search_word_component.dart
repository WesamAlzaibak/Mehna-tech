import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';

class SearchWordComponent extends StatelessWidget {
  final String word;
  const SearchWordComponent({Key? key, required this.word}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      color: Colors.grey[200],
      height: diSize.width*.15,
      width: diSize.width,
      child: Center(
        child: Text(
          word,
          style:const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppConstance.appColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
