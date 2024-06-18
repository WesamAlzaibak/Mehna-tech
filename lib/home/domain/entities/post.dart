import 'package:equatable/equatable.dart';

class Post extends Equatable{
  final int id;
  final String userName;
  final String text;
  final List<String> postImages;
  final String userImage;
  final int likesCount;
  final bool isVideo;
  final String videoPath;

  const Post({
    required this.id,
    required this.userName,
    required this.text,
    required this.postImages,
    required this.userImage,
    required this.likesCount,
    required this.isVideo,
    required this.videoPath,
  });

  @override
  List<Object> get props =>[
    id,
    userName,
    text,
    postImages,
    userImage,
    likesCount,
    isVideo,
    videoPath,
  ];

///the extend here for if the data that arrive is equal with everything then the method override will do it novelty
}