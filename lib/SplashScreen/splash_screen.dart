import 'package:assignment/Builder/builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashController();
  }

   Future<void> _splashController() async {

   await Future.delayed(const Duration(seconds: 1));
   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const ViewData() ));

  } 

  @override
  Widget build(BuildContext context) {


 
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            //   'https://w7.pngwing.com/pngs/346/738/png-transparent-shooting-shot-players-football.png'
            // ),
            Image.asset('assets/nice.png', 
            height: MediaQuery.of(context).size.width/2
            ),
            // const Icon(Icons.sports_football_rounded),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text("Soccer", style: GoogleFonts.aBeeZee(
                fontSize: 45,
                color: Colors.grey.shade400
               ),),
             ),
          ],
        ),
      ),
    );
  }
}