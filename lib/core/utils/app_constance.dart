import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mehna_tech/core/network/cache_helper.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';

class AppConstance{
  static const baseURL = "http://10.0.2.2:8000/";

  static const loginURL = "${baseURL}client/login";

  static const registerCustomerURL = "${baseURL}client/signup";

  static const resetPasswordURL = "${baseURL}client/reset-password";

  static const verifyEmailURL = "${baseURL}client/verify-email";

  static const resendCodeURL = "${baseURL}client/send-code/reset";

  static const forgetPasswordURL = "${baseURL}client/send-code/reset";

  static const homePostsURL = "";

  static const promotePostsURL = "";

  static const categoriesURL = "";

  static const categorySearchURL = "";

  static const workshopProfileURL = "";

  static const followWorkshopURL = "";

  static const profilePostsURL = "";

  static const orderURL = "";

  static const citiesURL = "";

  static const placesURL = "";

  static const servicesURL = "";

  static const appColor = Color(0xFFfebd59);

  static const blackColor = Colors.black;

  static const whiteColor = Colors.white;


  static Map<String, String> tokenHeaders = {
    "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}",
    "Accept": "application/json",
  };

  static Map<String,String> sendHeaders = {"Accept": "application/json"};

  Widget defaultBottom({
    double width = 200,
    required Function function,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    double radius = 1.0,
    bool isLoading = false, // New parameter for loading state
  }) =>
      Container(
        width: width,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
        ),
        child: MaterialButton(
          onPressed: () {
            if (!isLoading) {
              function();
            }
          },
          child: isLoading
              ?const CircularProgressIndicator() // Display CircularProgressIndicator when isLoading is true
              : Text(
            text.toUpperCase(),
            style:  TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      );

  Widget myDialogDualButton({
    @required context,
    required Map mapValue,
    var nextScreen,
    var email,
  }) =>
      AlertDialog(
        title:const Center(child: Text("Message")),
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        content: SizedBox(
          height: 60,
          child: myText(
            text: "${mapValue["meta"]["message"]}",
          ),
        ),
        actions: [
          TextButton(
            child: myText(
              text: "Cancel",
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: myText(
              text: "Continue",
            ),
            onPressed: () {
              Navigator.pop(context);
              navigateTo(context, nextScreen);
              // if (email != null)
              //   VerifyCubit().ResendCodeVerfication(email: email);
            },
          ),
        ],
      );

  void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

  Widget mySnackBar({
    required String text,
  }) =>
      SnackBar(
        content: Text(
          text,
        ),
        duration:const Duration(seconds: 1),
      );

  Widget myText({
    required String text,
  }) =>
      Text(
        text.toString(),
        maxLines: 4,
        style:const TextStyle(
            color: AppConstance.blackColor,
            fontSize: 20,
            fontFamily: 'SourceSansPro',
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none),
      );

  Widget myDialogSingleButton({
    required context,
    String? sendMessage,
    required bool ok,
    var nextScreen,
    bool pop = false,
    var function,
  }) =>
      AlertDialog(
        title:const Center(child: Text("Message")),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        content: Container(
          alignment: Alignment.center,
          height: 140,
          child: myText(
            text: (sendMessage).toString(),
          ),
        ),
        actions: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: TextButton(
              child: myText(
                text: ok ? "OK" : "Cancel",
              ),
              onPressed: () {
                if (ok) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  if (pop == true) {
                    function();
                  } else {
                    navigateTo(context, nextScreen);
                  }
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      );

  Widget defaultBottom2({
    double width = 200,
    Color background = AppConstance.whiteColor,
    required Function function,
    required String text,
    double radius = 1.0,
    bool isLoading = false, // New parameter for loading state
  }) =>
      Container(
        width: width,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: const Color(0xFF272739),
        ),
        child: MaterialButton(
          onPressed: () {
            if (!isLoading) {
              function();
            }
          },
          child: isLoading
              ?const CircularProgressIndicator() // Display CircularProgressIndicator when isLoading is true
              : Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: AppConstance.whiteColor,
            ),
          ),
        ),
      );

  Widget postComponent({
    required Post post,
    required formattedTime,
    required BuildContext context,
  })=>Column(
    children: [
      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConstance.whiteColor,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        post.userImage,
                      ),
                      radius: 30,
                    ),
                  ),
                  const SizedBox(
                      width: 20
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.userName,
                        style:const TextStyle(
                          fontSize: 20,
                          color: AppConstance.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                post.text,
                style:const TextStyle(
                  color: AppConstance.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 350.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: post.postImages.map(
                    (item) {
                  return CachedNetworkImage(
                    height: 560.0,
                    imageUrl: item,
                    fit: BoxFit.cover,
                  );
                },
              ).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    "${post.likesCount} "+getLang(context, "loves"),
                    style:const TextStyle(
                      color: AppConstance.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Material(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                      color: AppConstance.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Divider(height: 1),
    ],
  );


  Widget defaultFormField({
    required TextEditingController controller,
    required TextInputType type,
    required String labelText,
    Function? validate,
    double? height,
    IconData? suffix,
    IconData? prefix,
    var formKey,
    int? maxLength,
    bool hideLength = false,
    Function? functionValidate,
    Function? suffixPressed,
    Function? prefixPressed,
  }) {
    return SizedBox(
      height: height,
      child: TextFormField(
        validator: (value) {
          return validate!(value);
        },
        controller: controller,
        keyboardType: type,
        maxLength: maxLength,
        maxLines: null,
        decoration: InputDecoration(
          prefixIcon: prefix != null
              ? IconButton(
            icon: Icon(
              prefix,
              color: AppConstance.appColor,
            ),
            onPressed: () {
              prefixPressed!();
            },
          )
              : null,
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 20,
              color: AppConstance.appColor,
              fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: AppConstance.appColor, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: AppConstance.appColor),
          ),
          suffixIcon:suffix!=null? IconButton(
            icon: Icon(
              suffix,
              color: AppConstance.appColor,
            ),
            onPressed: () {
              suffixPressed!();
            },
          ):null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

}