import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saber_orixas/views/home_page.dart';

void main() {
  runApp(const SaberOrixas());
}

class SaberOrixas extends StatelessWidget {
  const SaberOrixas({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Saber os Orixás',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}
