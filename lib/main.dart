import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mehna_tech/auth/data/datasource/auth_remote_data_source.dart';
import 'package:mehna_tech/auth/data/repository/auth_repository.dart';
import 'package:mehna_tech/auth/domain/useCases/post_forget_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_login.dart';
import 'package:mehna_tech/auth/domain/useCases/post_register.dart';
import 'package:mehna_tech/auth/domain/useCases/post_reset_password.dart';
import 'package:mehna_tech/auth/domain/useCases/post_verify_code.dart';
import 'package:mehna_tech/auth/presentation/controller/login_controller/login_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/reset_password_controller/reset_password_bloc.dart';
import 'package:mehna_tech/auth/presentation/controller/verify_code_controller/verify_code_bloc.dart';
import 'package:mehna_tech/core/network/cache_helper.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_local.dart';
import 'package:mehna_tech/home/data/datasource/home_remote_data_source.dart';
import 'package:mehna_tech/home/data/repository/home_repository.dart';
import 'package:mehna_tech/home/domain/useCases/get_categories.dart';
import 'package:mehna_tech/home/domain/useCases/get_home_posts.dart';
import 'package:mehna_tech/home/domain/useCases/get_promote_posts.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';
import 'package:mehna_tech/order/data/datasource/order_remote_data_source.dart';
import 'package:mehna_tech/order/data/repository/order_repository.dart';
import 'package:mehna_tech/order/domain/useCases/get_cities.dart';
import 'package:mehna_tech/order/domain/useCases/get_places.dart';
import 'package:mehna_tech/order/domain/useCases/get_services.dart';
import 'package:mehna_tech/order/domain/useCases/post_order.dart';
import 'package:mehna_tech/order/presentation/controller/order_bloc.dart';
import 'package:mehna_tech/order/presentation/screens/order_description_screen.dart';
import 'package:mehna_tech/workshop_profile/data/datasource/workshop_profile_remote_data_source.dart';
import 'package:mehna_tech/workshop_profile/data/repository/workshop_profile_repository.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_posts.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/get_workshop_profile.dart';
import 'package:mehna_tech/workshop_profile/domain/useCases/post_follow_workshop.dart';
import 'package:mehna_tech/workshop_profile/presentation/controller/profile_bloc.dart';
import 'package:mehna_tech/search/data/datasource/search_remote_data_source.dart';
import 'package:mehna_tech/search/data/repository/search_repository.dart';
import 'package:mehna_tech/search/domain/useCases/get_category_workshops.dart';
import 'package:mehna_tech/search/domain/useCases/get_search_result.dart';
import 'package:mehna_tech/search/presentation/controller/search_bloc.dart';
import 'package:provider/provider.dart';
import 'package:mehna_tech/auth/presentation/controller/register_controller/register_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final servicesLocator = ServicesLocator();
  servicesLocator.init();
  bool cacheInitialized = await CacheHelper.init();

  if (cacheInitialized) {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRemoteDataSource = AuthRemoteDataSource();
    final authRepository = AuthRepository(authRemoteDataSource);
    final homeRemoteDataSource = HomeRemoteDataSource();
    final homeRepository = HomeRepository(homeRemoteDataSource);
    final searchRemoteDataSource = SearchRemoteDataSource();
    final searchRepository = SearchRepository(searchRemoteDataSource);
    final workshopProfileRemoteDataSource = WorkshopProfileRemoteDataSource();
    final workshopProfileRepository = WorkshopProfileRepository(workshopProfileRemoteDataSource);
    final orderRemoteDataSource = OrderRemoteDataSource();
    final orderRepository = OrderRepository(orderRemoteDataSource);
    //CacheHelper.saveData(key: 'picture' , value:"https://www.sheknows.com/wp-content/uploads/2022/11/leonardo-dicaprio.jpg?w=1440");
    return MultiProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
              GetHomePostsUseCase(homeRepository),
              GetCategoriesUseCase(homeRepository),
              GetPromotePostsUseCase(homeRepository),
            ),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(
            PostOrderUseCase(orderRepository),
            GetServicesUseCase(orderRepository),
            GetCitiesUseCase(orderRepository),
            GetPlacesUseCase(orderRepository),
          ),
        ),
        BlocProvider<WorkshopProfileBloc>(
          create: (context) => WorkshopProfileBloc(
            GetWorkshopProfileUseCase(workshopProfileRepository),
            GetWorkshopPostsUseCase(workshopProfileRepository),
            PostFollowWorkshopUseCase(workshopProfileRepository),
          ),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(
            GetCategoryWorkshopsUseCase(searchRepository),
            GetSearchResultUseCase(searchRepository),
          ),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(
            PostRegisterUseCase(authRepository),
          ),
        ),
        BlocProvider<LoginBloc>(
            create: (context)=>LoginBloc(
              PostLoginUseCase(authRepository),
            )
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => ResetPasswordBloc(
            PostForgetPasswordUseCase(authRepository),
            PostResetPasswordUseCase(authRepository),
          ),
        ),
        BlocProvider<VerifyCodeBloc>(
          create: (context) => VerifyCodeBloc(
            PostVerifyCodeUseCase(authRepository),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        home: OrderDescriptionScreen(),
        localizationsDelegates:const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
        supportedLocales: const[
            Locale("en" , ""), // English
            Locale("ar" , ""), // Arabic
          ],
        localeResolutionCallback: (currentLang , supportLang){
            if(currentLang != null){
              for(Locale local in supportLang){
                if(local.languageCode == currentLang.languageCode){
                  return currentLang;
                }
              }
            }
            return supportLang.first;
          },
      ),
    );
  }
}