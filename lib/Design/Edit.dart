import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage(
                    "assets/e.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 46, top: 50),
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h,),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text('Name',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 100.h,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only( left: 30),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      prefixIcon: Icon(Icons.edit))),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            height: 40.h,
            width: 135.w,
            padding: const EdgeInsets.all(4),
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                'Submit',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
