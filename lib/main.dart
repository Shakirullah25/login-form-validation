import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view%20model/view_model.dart';
import 'views/Pages/SignUp%20Pages/signup_form_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Form Page",
      theme: ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF60983C),
        ), // Green color
      ),
      home: const SignUpFormPage(),
    );
  }
}
