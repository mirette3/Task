import 'package:flutter/material.dart';
import 'package:task_etisalat/controller/home_cubit/home_cubit.dart';
import 'package:task_etisalat/controller/layout_cubit/cubit.dart';
import 'package:task_etisalat/controller/network/local/catch_helper.dart';
import 'package:task_etisalat/controller/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_etisalat/view/screens/app_layout.dart';
import 'package:task_etisalat/view/screens/signin_screen.dart';
import 'package:task_etisalat/view/screens/signup_screen.dart';
import 'package:task_etisalat/view/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'view/shared/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DioHelper.init();
  await CacheHelper.init();

  //List<dynamic>? list = CacheHelper.get(key:"fav");
  // String user= CacheHelper.get( key: 'key');
  // List jsonString = json.decode(user);
  // MainModel model = MainModel.fromJson(jsonString);

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final _auth=FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayoutCubit>(
          create: (BuildContext context) => LayoutCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        )
      ],
      child: MaterialApp(
        title: 'TASK',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
    initialRoute: _auth.currentUser != null ? "applayout_screen":"welcome_screen" ,
    routes: {
      "welcome_screen": (context) => WelcomeScreen(),
      "signin_screen": (context) => SignInScreen(),
      "signout_screen": (context) => SignUpScreen(),
      "applayout_screen": (context) => AppLayout(),
    }

    ),
    );
  }
}
