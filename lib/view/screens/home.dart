import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_etisalat/controller/home_cubit/home_cubit.dart';
import 'package:task_etisalat/controller/home_cubit/home_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:task_etisalat/view/widgets/fav_Item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                  vertical: MediaQuery.of(context).size.height / 30),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    textAlign: TextAlign.left,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    onSubmitted: (val) => cubit.getSearch(val),
                    decoration: InputDecoration(
                      hintText: "Search for...",
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.lightGreen),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 50,
                          horizontal: MediaQuery.of(context).size.width / 35),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightGreen, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  ConditionalBuilder(
                    condition: cubit.mainModel != null,
                    builder: (context) => Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) =>
                                buildFavItem( context, index,cubit.mainModel!),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: cubit.mainModel!.search!.length)),
                    fallback: (context) =>
                        const Center(child: Text("No RESALUTS..")),
                  )
                ],
              ),
            ),
          );
        });
  }
}
