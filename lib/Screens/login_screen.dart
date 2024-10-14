import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';

import '../Firebase Services/google_auth_services.dart';
import '../Utils/color_palate.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.waving_hand,
              size: 200,
              color: primaryColor,
            ),
            Text(
              "Habit Tracker App",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontSize: 60,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        alignment: Alignment.center,
        // color: Colors.grey,
        child: SignInButton(
          buttonType: ButtonType.google,
          onPressed: () async {
            String status =
                await GoogleAuthServices.googleAuthServices.signInWithGoogle();
            if (status == 'Success') {
              Get.offAll(const HomeScreen());
            }
          },
          btnColor: Colors.black,
          btnTextColor: Colors.white,
          buttonSize: ButtonSize.large,
        ),
      ),
    );
  }
}
