import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pages/home_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = TextStyle(
      fontSize: 35.0,
      fontFamily: 'Horizon',
      color: Colors.black,
      letterSpacing: 12);

  @override
  void initState() {
    super.initState();
  
    WidgetsBinding.instance.addPostFrameCallback((duration ) {

     Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.off(() => const HomePage(),
            transition: Transition.zoom, duration: const Duration(seconds: 4));
      },
    );

     

  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(height: Get.height * 0.05),

          SizedBox(
            height: Get.height * 0.08,
          ),

          Image.asset(
            'assets/poke.gif',
            scale: 0.6,
            fit: BoxFit.cover,
          ),

          Image.asset(
            'assets/88gJ.gif',
            scale: 0.6,
            fit: BoxFit.cover,
          ),

          SizedBox(
            height: Get.height * 0.05,
          ),
          Text('Cargando...',
              style: TextStyle(
                  fontSize: Get.height * 0.05, fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }
}
