import 'package:flutter/material.dart';
import 'package:task_etisalat/view/widgets/custoum_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              textColor: Colors.white,
              bgColor: Colors.lightGreen,
              title: "Sign in",
              onPressed: () {
                Navigator.pushNamed(context, "signin_screen");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            CustomButton(
                bgColor: Colors.white,
                textColor: Colors.lightGreen,
                title: "Sign Up",
                onPressed: () {
                  Navigator.pushNamed(context, "signout_screen");
                })
          ],
        ),
      ),
    );
  }
}
