import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehna_tech/core/useCases/base_useCase.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/order/domain/useCases/get_cities.dart';
import 'package:mehna_tech/order/domain/useCases/get_places.dart';
import 'package:mehna_tech/order/domain/useCases/get_services.dart';
import 'package:mehna_tech/order/domain/useCases/post_order.dart';
import 'package:mehna_tech/order/presentation/controller/order_event.dart';
import 'package:mehna_tech/order/presentation/controller/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.postOrderUseCase,this.getServicesUseCase,this.getCitiesUseCase,this.getPlacesUseCase) : super(const OrderState()) {
    on<PostOrderEvent>(_postOrder);
    on<GetServicesEvent>(_getServices);
    on<GetCitiesEvent>(_getCities);
    on<GetPlacesEvent>(_getPlaces);
    on<ChooseOneEvent>(_chooseOne);
    on<PutTheInitSelectedListEvent>(_putTheInitSelected);
    on<ChoosePhotosListEvent>(_chooseImagesList);
  }
  final PostOrderUseCase postOrderUseCase;
  final GetServicesUseCase getServicesUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final GetPlacesUseCase getPlacesUseCase;

  FutureOr<void> _postOrder(PostOrderEvent event, Emitter<OrderState> emit) async {
    final result = await postOrderUseCase(OrderParameters(
        categoryId: event.categoryId, workshopId: event.workshopId,
        servicesIds: event.servicesIds, orderDescription: event.orderDescription,
      orderPhotos: event.orderPhotos, context: event.context,
    ));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            orderState: RequestState.error,
            orderMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                orderState: RequestState.loaded,
                order: r,
              ))
      );
    } else {
      emit(state.copyWith(
        orderState: RequestState.error,
        orderMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getServices(GetServicesEvent event, Emitter<OrderState> emit) async {
    final result = await getServicesUseCase(ServicesParameters(categoryId: event.categoryId , context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            servicesState: RequestState.error,
            servicesMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                servicesState: RequestState.loaded,
                services: r,
              ))
      );
    } else {
      emit(state.copyWith(
        servicesState: RequestState.error,
        servicesMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getCities(GetCitiesEvent event, Emitter<OrderState> emit) async {
    final result = await getCitiesUseCase(ContextParameters(context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            citiesState: RequestState.error,
            citiesMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                citiesState: RequestState.loaded,
                cities: r,
              ))
      );
    } else {
      emit(state.copyWith(
        citiesState: RequestState.error,
        citiesMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _getPlaces(GetPlacesEvent event, Emitter<OrderState> emit) async {
    final result = await getPlacesUseCase(PlacesParameters(cityId: event.cityId , context: event.context));
    // ignore: unnecessary_null_comparison
    if (result != null) {
      result.fold((l) =>
          emit(state.copyWith(
            placesState: RequestState.error,
            placesMessage: l.message,
          )),
              (r) =>
              emit(state.copyWith(
                placesState: RequestState.loaded,
                places: r,
              ))
      );
    } else {
      emit(state.copyWith(
        placesState: RequestState.error,
        placesMessage: "An error occurred while logging in.",
      ));
    }
  }

  FutureOr<void> _chooseOne(ChooseOneEvent event, Emitter<OrderState> emit) async{
    emit( state.copyWith(selected: event.newSelected,selectedState: RequestState.loaded));
  }

  void _putTheInitSelected(PutTheInitSelectedListEvent event, Emitter<OrderState> emit){
     emit(state.copyWith(selected: event.selected,selectedState: RequestState.loaded),);
  }





  Future<void> _chooseImagesList(ChoosePhotosListEvent event , Emitter<OrderState> emit) async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    else {
      emit(state.copyWith(files: event.files,),);
    }
  }


}