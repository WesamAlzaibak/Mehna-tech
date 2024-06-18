import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/dummy.dart';
import 'package:mehna_tech/home/presentation/controller/home_bloc.dart';
import 'package:mehna_tech/home/presentation/controller/home_state.dart';
import 'package:mehna_tech/search/presentation/screens/workshops_search_screen.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return  BlocBuilder<HomeBloc,HomeState>(
        buildWhen: (previous  , current) =>
        previous.categoriesState !=  current.categoriesState,
        builder: (context , state){
          switch(state.homePostsState){
            case RequestState.loading: return SizedBox(
                height: diSize.height*1,
                child: const Center(child: CircularProgressIndicator()));
            case RequestState.loaded:  return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(categoriesList.length, (index) {
                  return service(diSize: diSize, name: categoriesList[index].name, image: categoriesList[index].image,context: context, categoryId: categoriesList[index].categoryId);
                }),
              ),
            );
            case RequestState.error: return SizedBox(
                height: 400,
                child:  Center(child: Text(state.promotePostsMessage,style:const TextStyle(color: Colors.white,fontSize: 25),)));
          }
        }
    );
  }




  Widget service({
    required int categoryId,
    required Size diSize,
    required String name,
    required String image,
    required BuildContext context,
  }) => GestureDetector(
    child: Container(
      height: diSize.height*.45,width: diSize.width*.28,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: diSize.width*.01,
          ),
          Expanded(child: CachedNetworkImage(imageUrl: image)),
          Expanded(
            child: Text(
              name,
              style:const TextStyle(
                fontWeight: FontWeight.normal,
                color: AppConstance.blackColor,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    ),
    onTap: (){
      AppConstance().navigateTo(context, WorkshopsSearchScreen(x: 1,typeWord: name, categoryId: categoryId,));
    },
  );
}