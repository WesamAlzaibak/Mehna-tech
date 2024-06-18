import 'package:mehna_tech/home/domain/entities/post.dart';

class PostModel extends Post{

  const PostModel({
    required super.id,
    required super.userName,
    required super.text,
    required super.postImages,
    required super.userImage,
    required super.likesCount,
    required super.isVideo,
    required super.videoPath,
  });

  factory PostModel.fromJson(Map<String,dynamic> json)=>PostModel(
    id: json["id"],
    userName: json["userName"],
    text: json["text"],
    postImages:  List<String>.from(json["postImages"]),
    userImage: json["userImage"],
    likesCount: json["likesCount"],
    isVideo: json["isVideo"],
    videoPath: json["videoPath"],
  );

}