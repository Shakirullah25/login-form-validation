import 'package:flutter/material.dart';
import 'package:login_form_page/views/Pages/SignIn%20Pages/sign_in_page.dart';

PreferredSizeWidget signUpAppBar(BuildContext context, String appbarTitle) {
    return AppBar(
      elevation: 0,
      // centerTitle: false,
      backgroundColor: const Color(0xFFFFFFFF),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xFF60983C),
          size: 20,
        ),
        onPressed: () {
         Navigator.pop(context);
        },
      ),
      actions: [
        const SizedBox(
          width: 10,
        ),
         Text(
          appbarTitle,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 8),
              backgroundColor: const Color(0xFFFFFFFF),
              foregroundColor: const Color(0xFFFF59A2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: Color(0xFFFF59A2),
                  width: 1.0,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
          );
            },
            child: const Text(
              "Log in",
              style: TextStyle(
                color: Color(0xFFFF59A2),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }