//
// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatelessWidget {
//   String location;
//   List<dynamic> listFriends;
//   String TextBottom;
//   String JobTitle;
//   bool isFriend;
//   bool isSentToMe;
//   bool isSendToHim;
//   int available;
//   int id;
//   BuildContext context;
//   ProfileScreen({
//     required this.id,
//   });
//   final double Coverheight = 240;
//   final double Profileheight = 155;
//   @override
//   Widget build(BuildContext context) {
//               return Scaffold(
//                 body: ListView(
//                   padding: EdgeInsets.zero,
//                   children: <Widget>[
//
//                     Container(
//                       color: Colors.grey[300],
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           //itemExtent: 1000,
//                           itemCount: postwidget.length,
//                           primary: false,
//                           padding: const EdgeInsets.all(8),
//                           itemBuilder: (BuildContext context, int index) {
//                             return postwidget[index];
//                           }),
//                     ),
//                   ],
//                 ),
//               );
//             }));
//   }
//
//   void changetext() {
//     isFriend
//         ? TextBottom = "Remove Friend"
//         : isSentToMe
//         ? TextBottom = "Accept Request"
//         : isSendToHim
//         ? TextBottom = "Cancel Request"
//         : TextBottom = "Add Friend";
//   }
//
//   Widget BuildTop({@required BuildContext context}) {
//     final bottom = Profileheight / 2;
//     final top = Coverheight - Profileheight / 2;
//     return Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: [
//           Container(
//               margin: EdgeInsets.only(bottom: bottom),
//               child: BuildCoverImage(context: context)),
//           Positioned(
//             top: top,
//             child: BuildProfileImage(context: context),
//           ),
//         ]);
//   }
//
//   Widget BuildCoverImage({@required BuildContext context}) => Container(
//     color: Colors.grey,
//     child: Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         Image.network(
//           '${profile.user.cover}',
//           width: double.infinity,
//           height: Coverheight,
//           fit: BoxFit.cover,
//         ),
//         profile.user.visitor?Container():
//         IconButton(onPressed: (){
//           navigateTo(context, ChangePicScreen(ForWhat: 1,));
//         }, icon: Icon(Icons.add_photo_alternate_outlined,color: Colors.white,)),
//       ],
//     ),
//   );
//   Widget BuildProfileImage({@required BuildContext context}) => Stack(alignment: Alignment.center, children: [
//     CircleAvatar(
//       radius: Profileheight / 2 + 5,
//       backgroundColor: Colors.white,
//     ),
//     Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         CircleAvatar(
//             radius: Profileheight / 2,
//             backgroundColor: Colors.grey.shade800,
//             backgroundImage: NetworkImage(
//               '${profile.user.picture}',
//             )),
//         profile.user.visitor?Container():
//         IconButton(onPressed: (){
//           navigateTo(context, ChangePicScreen(ForWhat: 2,));
//         }, icon: Icon(Icons.add_photo_alternate_outlined,color: Colors.white))
//       ],
//     ),
//   ]);
// }