import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class OrderEvent extends Equatable{
  const OrderEvent();
}

class PostOrderEvent extends OrderEvent{
  final int categoryId;
  final int workshopId;
  final List<int> servicesIds;
  final String orderDescription;
  final List<String> orderPhotos;
  final BuildContext context;
  const PostOrderEvent({
    required this.categoryId,
    required this.workshopId,
    required this.servicesIds,
    required this.orderDescription,
    required this.orderPhotos,
    required this.context,
  });

  @override
  List<Object?> get props => [categoryId,workshopId,servicesIds,orderDescription,orderPhotos,context];
}

class GetServicesEvent extends OrderEvent{
  final int categoryId;
  final BuildContext context;
  const GetServicesEvent({
    required this.categoryId,
    required this.context,
  });

  @override
  List<Object?> get props => [categoryId,context];
}

class GetCitiesEvent extends OrderEvent{
  final BuildContext context;

  const GetCitiesEvent({
    required this.context,
  });

  @override
  List<Object?> get props => [context];
}

class GetPlacesEvent extends OrderEvent{
  final int cityId;
  final BuildContext context;

  const GetPlacesEvent({
    required this.cityId,
    required this.context,
  });

@override
List<Object?> get props => [cityId,context];
}

class ChooseOneEvent extends OrderEvent{
  final List<bool> newSelected;
  final BuildContext context;

  const ChooseOneEvent({
    required this.newSelected,
    required this.context,
  });

  @override
  List<Object?> get props => [newSelected,context];
}

class PutTheInitSelectedListEvent extends OrderEvent{
  final List<bool> selected;

  const PutTheInitSelectedListEvent({
    required this.selected,
  });

  @override
  List<Object?> get props => [selected];
}

class ChoosePhotosListEvent extends OrderEvent{
  final List<XFile> files;

  const ChoosePhotosListEvent({
    required this.files,
  });

  @override
  List<Object?> get props => [files];
}