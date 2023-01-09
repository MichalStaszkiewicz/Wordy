import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordy/home_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(),
     
        primarySwatch: Colors.blue,
      ),
      home:   MyHomePage(),
    );
  }
}
