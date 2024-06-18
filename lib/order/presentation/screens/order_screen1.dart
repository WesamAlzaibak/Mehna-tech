import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/core/services/services_locator.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/order/presentation/controller/order_bloc.dart';
import 'package:mehna_tech/order/presentation/controller/order_event.dart';
import 'package:mehna_tech/order/presentation/screens/services_screen.dart';

class OrderScreen extends StatelessWidget {
  final List<bool> isSelectedNow;
  final int categoryId;
  final int workshopId;
  const OrderScreen({Key? key, required this.isSelectedNow, required this.categoryId, required this.workshopId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderBloc>()..add(PutTheInitSelectedListEvent(selected: isSelectedNow)),
      child: Scaffold(
        backgroundColor: AppConstance.whiteColor,
        body: ServicesScreen(categoryId: categoryId, workshopId: workshopId,),
      ),
    );
  }
}