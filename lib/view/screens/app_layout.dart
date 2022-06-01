import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_etisalat/controller/layout_cubit/cubit.dart';
import 'package:task_etisalat/controller/layout_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppLayout extends StatelessWidget {
   AppLayout({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back_ios,
              color: Colors.lightGreen,
            ),
            backgroundColor: Colors.white,
            title: Text(
              cubit.titles[cubit.curr_index],
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.lightGreen,
                  fontSize: 25),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close,color: Colors.lightGreen,)),
            ],
          ),
          body: cubit.screens[cubit.curr_index],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourites',
              ),
            ],
            unselectedItemColor: Colors.black12,
            selectedItemColor: Colors.lightGreen,
            currentIndex: cubit.curr_index,
            onTap: (index) {
             cubit.changeState(index);
            },
          ),
        );
      },
    );
  }
}
