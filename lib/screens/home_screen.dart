import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_weather/controllers/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}