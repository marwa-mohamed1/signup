import 'package:flutter/material.dart';
import 'features/signup/screens/signup_screen.dart'; // تأكدي من المسار

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(), 
    );
  }
}
