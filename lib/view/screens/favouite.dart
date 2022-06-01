import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_etisalat/controller/home_cubit/home_cubit.dart';
import 'package:task_etisalat/controller/home_cubit/home_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:task_etisalat/model/search_model.dart';
import 'package:task_etisalat/view/widgets/fav_Item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =HomeCubit.get(context);
        List<MainModel> list = cubit.favItems;
        int index = 0;
        for (MainModel model in cubit.favItems) {
          cubit.indexx.addAll({model.search![0].id!: index});
          index++;
        }
        return ConditionalBuilder(
          condition: list.isNotEmpty,
          builder: (context) => SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                    vertical: MediaQuery.of(context).size.height / 30),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildFavItem(context, index, list[index]),
                  itemCount: list.length,
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ),
          ),
          fallback: (context) => const Center(
              child: Text(
            "NO FAVOURITES YET...",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          )),
        );
      },
    );
  }
}
