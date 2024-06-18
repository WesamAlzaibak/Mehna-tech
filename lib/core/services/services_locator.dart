import 'package:get_it/get_it.dart';
import 'package:mehna_tech/auth/data/datasource/auth_remote_data_source.dart';
import 'package:mehna_tech/auth/data/repository/auth_repository.dart';
import 'package:mehna_tech/auth/domain/repository/base_auth_repository.dart';
import 'package:mehna_tech/auth/domain/useCases/post_forget_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_login.dart';
import 'package:mehna_tech/auth/domain/useCases/post_register.dart';
import 'package:mehna_tech/auth/domain/useCases/post_reset_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_verify_code.dart';
import 'package:mehna_tech/auth/presentation/controller/login_controller/login_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/register_controller/register_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/verify_code_controller/verify_code_bloc.dart';
import 'package:mehna_tech/home/data/datasource/home_remote_data_source.dart';
import 'package:mehna_tech/home/data/repository/home_repository.dart';
import 'package:mehna_tech/home/domain/repository/base_home_repository.dart';
import 'package:mehna_tech/home/domain/useCases/get_categories.dart';
import 'package:mehna_tech/home/domain/useCases/get_home_posts.dart';
import 'package:mehna_tech/home/domain/useCases/get_promote_posts.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';
import 'package:mehna_tech/order/data/datasource/order_remote_data_source.dart';
import 'package:mehna_tech/order/data/repository/order_repository.dart';
import 'package:mehna_tech/order/domain/repository/base_order_repository.dart';
import 'package:mehna_tech/order/domain/useCases/get_cities.dart';
import 'package:mehna_tech/order/domain/useCases/get_places.dart';
import 'package:mehna_tech/order/domain/useCases/get_services.dart';
import 'package:mehna_tech/order/domain/useCases/post_order.dart';
import 'package:mehna_tech/order/presentation/controller/order_bloc.dart';
import 'package:mehna_tech/workshop_profile/data/datasource/workshop_profile_remote_data_source.dart';
import 'package:mehna_tech/workshop_profile/data/repository/workshop_profile_repository.dart';
import 'package:mehna_tech/workshop_profile/domain/repository/base_workshop_profile_repository.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_posts.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/post_follow_workshop.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_bloc.dart';
import 'package:mehna_tech/search/data/datasource/search_remote_data_source.dart';
import 'package:mehna_tech/search/data/repository/search_repository.dart';
import 'package:mehna_tech/search/domain/repository/base_search_repository.dart';
import 'package:mehna_tech/search/domain/useCases/get_category_workshops.dart';
import 'package:mehna_tech/search/domain/useCases/get_search_result.dart';
import 'package:mehna_tech/search/presentation/controller/search_bloc.dart';

final sl=GetIt.instance;

class ServicesLocator {
  void init(){
    ///bloc
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => VerifyCodeBloc(sl()));
    sl.registerFactory(() => ResetPasswordBloc(sl() , sl()));
    sl.registerFactory(() => HomeBloc(sl() , sl() , sl()));
    sl.registerFactory(() => SearchBloc(sl() , sl()));
    sl.registerFactory(() => WorkshopProfileBloc(sl() , sl() , sl()));
    sl.registerFactory(() => OrderBloc(sl() , sl() , sl() , sl()));
    ///useCases
    sl.registerLazySingleton(() => PostLoginUseCase(sl()));
    sl.registerLazySingleton(() => PostRegisterUseCase(sl()));
    sl.registerLazySingleton(() => PostVerifyCodeUseCase(sl()));
    sl.registerLazySingleton(() => PostForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => PostResetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => GetHomePostsUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetPromotePostsUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoryWorkshopsUseCase(sl()));
    sl.registerLazySingleton(() => GetSearchResultUseCase(sl()));
    sl.registerLazySingleton(() => GetWorkshopProfileUseCase(sl()));
    sl.registerLazySingleton(() => GetWorkshopPostsUseCase(sl()));
    sl.registerLazySingleton(() => PostFollowWorkshopUseCase(sl()));
    sl.registerLazySingleton(() => PostOrderUseCase(sl()));
    sl.registerLazySingleton(() => GetServicesUseCase(sl()));
    sl.registerLazySingleton(() => GetCitiesUseCase(sl()));
    sl.registerLazySingleton(() => GetPlacesUseCase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseAuthRepository>(
            () => AuthRepository(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(
            () => HomeRepository(sl()));
    sl.registerLazySingleton<BaseSearchRepository>(
            () => SearchRepository(sl()));
    sl.registerLazySingleton<BaseWorkshopProfileRepository>(
            () => WorkshopProfileRepository(sl()));
    sl.registerLazySingleton<BaseOrderRepository>(
            () => OrderRepository(sl()));
    ///data Source
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
            () => AuthRemoteDataSource());
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
            () => HomeRemoteDataSource());
    sl.registerLazySingleton<BaseSearchRemoteDataSource>(
            () => SearchRemoteDataSource());
    sl.registerLazySingleton<BaseWorkshopProfileRemoteDataSource>(
            () => WorkshopProfileRemoteDataSource());
    sl.registerLazySingleton<BaseOrderRemoteDataSource>(
            () => OrderRemoteDataSource());
  }
}