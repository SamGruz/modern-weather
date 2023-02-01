import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modern_weather/controllers/global_controller.dart'; 
import 'package:geocoding/geocoding.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";

  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAdress(globalController.getLattitude().value, globalController.getLongitude().value);

    super.initState();
  }
  getAdress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;      
    });
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:  const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(city,
          style: const TextStyle(
            fontSize: 20,
            height: 2,
            ),
            ),
        ),
        Container(
          margin:  const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: const TextStyle(
            fontSize: 14, 
            color: Colors.grey, height: 1.5),
            ),
        )
      ],
    );
  }
}