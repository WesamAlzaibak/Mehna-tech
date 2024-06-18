
import 'package:equatable/equatable.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/home/domain/entities/category.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/home/domain/entities/promote_posts.dart';

class HomeState extends Equatable{
  final int currentIndex;
  final List<Post> homePosts;
  final RequestState homePostsState;
  final String homePostsMessage;
  final List<PromotePosts> promotePosts;
  final RequestState promotePostsState;
  final String promotePostsMessage;
  final List<Categories> categories;
  final RequestState categoriesState;
  final String categoriesMessage;
  const HomeState({
    this.currentIndex = 0,
    this.homePosts = const [],
    this.homePostsState = RequestState.loaded,
    this.homePostsMessage = "",
    this.promotePosts = const [],
    this.promotePostsState = RequestState.loaded,
    this.promotePostsMessage = "",
    this.categories = const [],
    this.categoriesState = RequestState.loaded,
    this.categoriesMessage = "",
    //I make it loaded by default just because i work with static data
    //it is should be loading by default
  });
  HomeState copyWith({
    int? currentIndex,
    List<Post>? homePosts,
    RequestState? homePostsState,
    String? homePostsMessage,
    List<PromotePosts>? promotePosts,
    RequestState? promotePostsState,
    String? promotePostsMessage,
    List<Categories>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,
  })
  {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      homePosts: homePosts ?? this.homePosts ,
      homePostsState: homePostsState  ??  this.homePostsState ,
      homePostsMessage: homePostsMessage  ??  this.homePostsMessage  ,
      promotePosts: promotePosts ?? this.promotePosts ,
      promotePostsState: promotePostsState  ??  this.promotePostsState ,
      promotePostsMessage: promotePostsMessage  ??  this.promotePostsMessage ,
      categories: categories ?? this.categories ,
      categoriesState: categoriesState  ??  this.categoriesState ,
      categoriesMessage: categoriesMessage  ??  this.categoriesMessage ,
    );
  }

  @override
  List<Object> get props => [
    currentIndex,
    homePosts,
    homePostsState,
    homePostsMessage,
    promotePosts,
    promotePostsState,
    promotePostsMessage,
    categories,
    categoriesState,
    categoriesMessage,
  ];

}