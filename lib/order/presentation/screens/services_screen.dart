import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehna_tech/auth/presentation/screens/register_screen.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/core/utils/enums.dart';
import 'package:mehna_tech/order/presentation/controller/order_bloc.dart';
import 'package:mehna_tech/order/presentation/controller/order_event.dart';
import 'package:mehna_tech/order/presentation/controller/order_state.dart';

class ServicesScreen extends StatelessWidget {
  final int categoryId;
  final int workshopId;
  const ServicesScreen({Key? key, required this.categoryId, required this.workshopId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) => previous.selected != current.selected,
      builder: (context, state) {
        switch (state.selectedState) {
          case RequestState.loading:
            return SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: const Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return Scaffold(
              backgroundColor: AppConstance.whiteColor,
              appBar: AppBar(
                backgroundColor: AppConstance.appColor,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 105,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              "Choose the services that you want to make it in the Order",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: AppConstance.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        itemCount: state.selected.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CheckboxListTile(
                                  value: state.selected[index],
                                  title: const Text(
                                    "Electrical Installation",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: AppConstance.appColor),
                                  ),
                                  onChanged: (bool? value) {
                                    final List<bool> newSelected = List.from(state.selected);
                                    newSelected[index] = value!;
                                    BlocProvider.of<OrderBloc>(context).add(ChooseOneEvent(newSelected: newSelected, context: context));
                                  },
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: Divider(color: Colors.grey[900],))
                            ],
                          );
                        }),
                    AppConstance().defaultBottom(function: (){
                      for(int i=0;i<BlocProvider.of<OrderBloc>(context).state.selected.length;i++) {
                        if(BlocProvider.of<OrderBloc>(context).state.selected[i]){
                        AppConstance().navigateTo(context, registerScreen());
                        }
                      }
                    }, text: "Submit",
                        backgroundColor: AppConstance.appColor,
                        textColor: AppConstance.whiteColor)
                  ],
                ),
              ),
            );
            case RequestState.error:
              return const SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(
                      "there is no error",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                  )
              );
        }
        },
    );
  }
}