import 'package:flutter/material.dart';

class CategoriesCoverComponent extends StatelessWidget {
  const CategoriesCoverComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ourLogo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
