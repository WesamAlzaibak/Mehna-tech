import 'package:flutter/material.dart';
import 'package:mehna_tech/core/network/cache_helper.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/app_local.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return Drawer(
      width: diSize.width*.8,
      child: Column(
          children: [
            SizedBox(
              height: diSize.height*.3,
              width: diSize.width*.8,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppConstance.appColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75),bottomRight: Radius.circular(75)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                                "${CacheHelper.getData(key: 'picture')}"
                            ),
                          ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "وسام الزيبق",
                       style: TextStyle(
                         fontSize: 24.0, // Adjust the font size as needed
                         fontWeight: FontWeight.bold, // You can adjust the font weight
                         color: AppConstance.blackColor, // Choose an appropriate text color
                       ),
                      ),
                      Text(
                        "+963 995967227",
                        style: TextStyle(
                          fontSize: 16.0, // Adjust the font size as needed
                          fontWeight: FontWeight.normal, // You can adjust the font weight
                          color: Colors.grey[700], // Choose an appropriate text color
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {},
                      child:const Icon(
                        Icons.edit,
                        color: AppConstance.whiteColor, // Customize the icon color as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children:[
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      getLang(context, "setting"),
                      style:const TextStyle(
                        fontSize: 25.0, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // You can adjust the font weight
                        color: AppConstance.blackColor, // Choose an appropriate text color
                        letterSpacing: 1.2, // Adjust the letter spacing as needed
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.build,
                      size: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      getLang(context, "workshops"),
                      style:const TextStyle(
                        fontSize: 25.0, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // You can adjust the font weight
                        color: AppConstance.blackColor, // Choose an appropriate text color
                        letterSpacing: 1.2, // Adjust the letter spacing as needed
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.post_add_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      getLang(context, "your_orders"),
                      style:const TextStyle(
                        fontSize: 25.0, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // You can adjust the font weight
                        color: AppConstance.blackColor, // Choose an appropriate text color
                        letterSpacing: 1.2, // Adjust the letter spacing as needed
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.local_offer_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      getLang(context, "offers"),
                      style:const TextStyle(
                        fontSize: 25.0, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // You can adjust the font weight
                        color: AppConstance.blackColor, // Choose an appropriate text color
                        letterSpacing: 1.2, // Adjust the letter spacing as needed
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.logout_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      getLang(context, "logout"),
                      style:const TextStyle(
                        fontSize: 25.0, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // You can adjust the font weight
                        color: AppConstance.blackColor, // Choose an appropriate text color
                        letterSpacing: 1.2, // Adjust the letter spacing as needed
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
    );
  }
}