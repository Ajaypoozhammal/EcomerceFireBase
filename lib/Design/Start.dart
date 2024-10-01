import 'package:ecommeurcefb/Design/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _HomeState();
}

class _HomeState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/d.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 400,
            left: 50,
            child: Text(
              '    You want\n Authentic, here\n   you go!',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            top: 530,
            left: 80,
            child: Text(
              'Find it here, buy it now!',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color(0xFFF2F2F2),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(top: 600,left: 25,
            child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));},
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF73658),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Center(
                  child: Text(
                    'Get Start',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
