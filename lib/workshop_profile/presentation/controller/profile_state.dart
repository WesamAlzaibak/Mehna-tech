import 'package:equatable/equatable.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';
class WorkshopProfileState extends Equatable{
  final WorkshopProfile workshopProfile;
  final RequestState workshopProfileState;
  final String workshopProfileMessage;
  final List<Post> workshopPosts;
  final RequestState workshopPostsState;
  final String workshopPostsMessage;
  final NoEntities followWorkshop;
  final RequestState followWorkshopState;
  final String followWorkshopMessage;
  final bool isFollowed;

  const WorkshopProfileState({
    this.workshopProfile =const WorkshopProfile(workshopId: 0, name: 'wesam', picture: '', phoneNumber: "", workshopType: '', workshopPosts: [],isFollowed: false, followers: '', description: '',),
    this.workshopProfileState = RequestState.loaded,
    this.workshopProfileMessage = "",
    this.workshopPosts = const [],
    this.workshopPostsState = RequestState.loaded,
    this.workshopPostsMessage = "",
    this.followWorkshop = const NoEntities(status: ""),
    this.followWorkshopState = RequestState.loading,
    this.followWorkshopMessage = "",
    this.isFollowed = false,
    //I make it loaded by default just because i work with static data
    //it is should be loading by default
  });
  WorkshopProfileState copyWith({
    WorkshopProfile? workshopProfile,
    RequestState? workshopProfileState,
    String? workshopProfileMessage,
    List<Post>? workshopPosts,
    RequestState? workshopPostsState,
    String? workshopPostsMessage,
    NoEntities? followWorkshop,
    RequestState? followWorkshopState,
    String? followWorkshopMessage,
    bool? isFollowed,
  }){
    return WorkshopProfileState(
      workshopProfile: workshopProfile ?? this.workshopProfile ,
      workshopProfileState: workshopProfileState  ??  this.workshopProfileState ,
      workshopProfileMessage: workshopProfileMessage  ??  this.workshopProfileMessage ,
      workshopPosts: workshopPosts ?? this.workshopPosts ,
      workshopPostsState: workshopPostsState ?? this.workshopPostsState,
      workshopPostsMessage: workshopPostsMessage ?? this.workshopPostsMessage,
      followWorkshop: followWorkshop  ??  this.followWorkshop ,
      followWorkshopState: followWorkshopState  ??  this.followWorkshopState ,
      followWorkshopMessage: followWorkshopMessage  ??  this.followWorkshopMessage ,
      isFollowed: isFollowed ?? this.isFollowed ,
    );
  }

  @override
  List<Object> get props => [
    workshopProfile,
    workshopProfileState,
    workshopProfileMessage,
    workshopPosts,
    workshopPostsState,
    workshopPostsMessage,
    followWorkshop,
    followWorkshopState,
    followWorkshopMessage,
    isFollowed,
  ];

}