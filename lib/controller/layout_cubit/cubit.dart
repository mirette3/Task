import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_etisalat/controller/layout_cubit/states.dart';
import 'package:task_etisalat/view/screens/favouite.dart';
import 'package:task_etisalat/view/screens/home.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int curr_index = 0;
  List<Widget> screens = [
    HomeScreen(),
    const FavouriteScreen(),
  ];
  List<String> titles = [
    'Home', 'Favourites'
  ];
  void changeState(int index) {
    curr_index = index;
    emit(ChangeState());
  }
}