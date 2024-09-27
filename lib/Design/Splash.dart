import 'package:flutter/material.dart';

import 'onboard.dart';

class Screen1 extends StatefulWidget {

  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Screen2()));
    }
    );
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/a.png",height: 100,width: 100,),
                    Text(
                      'Stylish',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF73658),
                        fontSize: 40,
                        fontFamily: 'Libre Caslon Text',
                        fontWeight: FontWeight.w700,
                        height: 0.01,
                      ),
                    )
                  ],
                ),
              ],
            )      );
  }
}