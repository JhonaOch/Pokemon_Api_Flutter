
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/services/poke_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/poke_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var _pokeDataModel;

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
      letterSpacing: 12,
      fontWeight: FontWeight.bold);
  @override
  void initState() {
    super.initState();
    _pokeDataModel = PokeService().getDataPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset('assets/pokeLogo.png'),
                AnimatedTextKit(totalRepeatCount: 1000, animatedTexts: [
                  ColorizeAnimatedText(
                    'Pokemon',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            FutureBuilder<PokeModel>(
                future: _pokeDataModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: size.height * 0.60,
                      child: Swiper(
                        viewportFraction: 0.8,
                        fade: 0.3,
                        scale: 0.9,
                        autoplay: true,
                        itemCount: snapshot.data!.pokemon.length,
                        itemBuilder: (BuildContext context, int index) {
                          var pokeList = snapshot.data!.pokemon[index];

    
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height:
                                MediaQuery.of(context).size.width /2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 32, 25, 77),
                                  Color.fromARGB(255, 159, 35, 181),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(
                                  flex: 4,
                                ),

                                ExtendedImage.network(
                                  pokeList.img,
                                  scale: 0.5,

                                  fit: BoxFit.cover,
                                  cache: true,
                                  //cancelToken: cancellationToken,
                                ),

                                // Image(
                                //   image: NetworkImage(pokeList.img == null ?
                                //   '':pokeList.img ,scale: 0.6),
                                //   fit: BoxFit.fill,

                                // ),
                                SizedBox(
                                  height: 60,
                                ),
                                Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50)),
                                      color:
                                          Color.fromARGB(255, 215, 213, 214)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(pokeList.name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Height "
                                                  '${pokeList.height}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13)),
                                              Text(
                                                  "Weight "
                                                  '${pokeList.weight}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              
                              ],

                             
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),

      floatingActionButton:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
         
            FloatingActionButton.extended(
              onPressed:() async{
   await openwhatsapp();
  
    
              },
              backgroundColor: Colors.green,
              icon: Icon(Icons.whatsapp),
              label: Text('WA'),
            ),

            SizedBox(width: 8.0),

            //  FloatingActionButton.extended(
            //   onPressed: () {
            //     // Respond to button press
            //   },
            //   backgroundColor: Colors.blue,
            //   icon: Icon(Icons.facebook),
            //   label: Text('FB'),
            // ),
            
          ],
        ),

    //  bottomNavigationBar: BottomNavigationBar(  
    //     items: const <BottomNavigationBarItem>[  
    //       BottomNavigationBarItem(  
    //         icon: Icon(Icons.home), 
    //         label: 'home', 
    //         //title: Text('Home'),  
    //         backgroundColor: Colors.green  
    //       ),  
    //       // BottomNavigationBarItem(  
    //       //   icon: Icon(Icons.search),  
    //       //    label: 'home',  
    //       //   backgroundColor: Colors.yellow  
    //       // ),  
    //       BottomNavigationBarItem(  
    //         icon: Icon(Icons.person),  
    //          label: 'home', 
    //         backgroundColor: Colors.blue,  
    //       ),  
    //     ],  
    //   ) ,
      ),
    );
  }

  openwhatsapp() async{
  var whatsapp ="+593968074185";
  var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
  var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if(Platform.isIOS){
    // for iOS phone only
    if( await canLaunchUrl(Uri.parse(whatappURL_ios))){
       await launchUrl(Uri.parse(whatappURL_ios));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));

    }

  }else{
    // android , web
    if( await canLaunchUrl(Uri.parse(whatsappURl_android))){
      await launchUrl(Uri.parse(whatsappURl_android));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));

    }


  }

}
}
