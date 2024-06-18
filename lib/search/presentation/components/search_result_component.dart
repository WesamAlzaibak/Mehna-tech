import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/search/domain/entities/Search.dart';

class SearchResultComponent extends StatelessWidget {
  final Search search;
  const SearchResultComponent({Key? key, required this.search,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 170,
          width: diSize.width*.97,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius:const BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 15,left: 15,
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      search.picture,
                    ),
                    radius: 70,
                  )
              ),
              Positioned(
                top: 40,left: 170,width: diSize.width*.97-170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      search.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 25,
                        color: AppConstance.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 85,left: 170,width: diSize.width*.97-170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      search.phoneNumber,
                      style: TextStyle(
                        fontSize: 16.0, // Adjust the font size as needed
                        fontWeight: FontWeight.normal, // You can adjust the font weight
                        color: Colors.grey[700], // Choose an appropriate text color
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120,left: 170,
                child: Text(
                  "Type : ${search.workshopType}",
                  style:const TextStyle(
                    fontSize: 16.0, // Adjust the font size as needed
                    fontWeight: FontWeight.w600, // You can adjust the font weight
                    color: AppConstance.blackColor, // Choose an appropriate text color
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
            height: 5,
        ),
      ],
    );
  }
}