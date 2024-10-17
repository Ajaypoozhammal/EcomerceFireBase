import 'dart:async';

import 'package:ecommeurcefb/Design/BottomNavigation.dart';
import 'package:ecommeurcefb/Design/onboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    islogin(context);
    super.initState();

  }

void islogin(BuildContext context){
    final auth =FirebaseAuth.instance.currentUser;
    if(auth!=null){
      Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>Bottomnavigation())));
    }
    else{
      Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>Onboard())));
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 290),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/a.png",height: 100,width: 100,),
                Text(
                  'Stylish',
                  style: GoogleFonts.libreCaslonText(
                    textStyle: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
