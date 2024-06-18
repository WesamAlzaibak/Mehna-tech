
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/order/domain/entities/City.dart';
import 'package:mehna_tech/order/domain/entities/Place.dart';
import 'package:mehna_tech/order/domain/entities/Service.dart';

class OrderState extends Equatable{
  final NoEntities? order;
  final RequestState orderState;
  final String orderMessage;
  final List<Services> services;
  final RequestState servicesState;
  final String servicesMessage;
  final List<City> cities;
  final RequestState citiesState;
  final String citiesMessage;
  final List<Place> places;
  final RequestState placesState;
  final String placesMessage;
  final List<bool> selected;
  final RequestState selectedState;
  final List<XFile>? files;

  const OrderState({
    this.order,
    this.orderState = RequestState.loaded,
    this.orderMessage = "",
    this.services = const [],
    this.servicesState = RequestState.loaded,
    this.servicesMessage = "",
    this.cities = const[],
    this.citiesState = RequestState.loaded,
    this.citiesMessage = "",
    this.places = const[],
    this.placesState = RequestState.loaded,
    this.placesMessage = "",
    this.selected = const[],
    this.selectedState = RequestState.loading,
    this.files = const[],
    //I make it loaded by default just because i work with static data
    //it is should be loading by default
  });
  OrderState copyWith({
    NoEntities? order,
    RequestState? orderState,
    String? orderMessage,
    List<Services>? services,
    RequestState? servicesState,
    String? servicesMessage,
    List<City>? cities,
    RequestState? citiesState,
    String? citiesMessage,
    List<Place>? places,
    RequestState? placesState,
    String? placesMessage,
    List<bool>? selected,
    RequestState? selectedState,
    List<XFile>? files,
  }){
    return OrderState(
        order: order ?? this.order ,
        orderState: orderState  ??  this.orderState ,
        orderMessage: orderMessage  ??  this.orderMessage ,
        services: services ?? this.services ,
        servicesState: servicesState ?? this.servicesState,
        servicesMessage: servicesMessage ?? this.servicesMessage,
        cities: cities  ??  this.cities ,
        citiesState: citiesState  ??  this.citiesState ,
        citiesMessage: citiesMessage  ??  this.citiesMessage ,
        places: places  ??  this.places ,
        placesState: placesState  ??  this.placesState ,
        placesMessage: placesMessage  ??  this.placesMessage ,
        selected: selected ?? this.selected ,
        selectedState: selectedState ?? this.selectedState ,
        files: files ?? this.files ,
    );
  }

  @override
  List<Object?> get props => [
    order,
    orderState,
    orderMessage,
    services,
    servicesState,
    servicesMessage,
    cities,
    citiesState,
    citiesMessage,
    places,
    placesState,
    placesState,
    selected,
    selectedState,
    files,
  ];

}