import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Row(
            children: [
              SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset("assets/a.png")),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Stylish',
                style: GoogleFonts.libreCaslonText(
                  textStyle: TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
