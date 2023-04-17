import 'package:assignment/networks/API/repository.dart';
import 'package:assignment/user_interface/controller/game_controller.dart';
import 'package:assignment/user_interface/pages/game_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamesPage(),
    );
  }
}
