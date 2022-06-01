import 'package:flutter/material.dart';
import 'package:task_etisalat/controller/home_cubit/home_cubit.dart';
import 'package:task_etisalat/controller/home_cubit/home_states.dart';
import 'package:task_etisalat/model/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget addOrDeleteFav(context, MainModel model) {
  return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return IconButton(
          onPressed: () {
            if (cubit.favItemColor[model.search![0].id] == false ||
                cubit.favItemColor[model.search![0].id] == null) {
              cubit.addFavItem(model);
            } else {
              cubit.deleteFavItem(
                  cubit.indexx[model.search![0].id]!, model.search![0].id!);
            }
          },
          icon: Icon(
            Icons.favorite,
            color: cubit.favItemColor[model.search![0].id!] == true
                ? Colors.lightGreen
                : Colors.grey,
            size: 30,
          ),
        );
      });
}
