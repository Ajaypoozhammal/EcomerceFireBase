import 'package:ecommeurcefb/Design/Edit.dart';
import 'package:ecommeurcefb/Design/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/e.png"),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Edit()));},
                child: Container(
                  width: 250,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC7C7C7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "edit",
                          style: GoogleFonts.libreCaslonText(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Order()));},
                child: Container(
                  width: 250,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC7C7C7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        Text(
                          "Order",
                          style: GoogleFonts.libreCaslonText(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        //SizedBox(width: 80.w,),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 250,
                height: 48,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFC7C7C7)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.logout),
                      //  SizedBox(width: 80.w,),

                      Text(
                        "Logout",
                        style: GoogleFonts.libreCaslonText(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      //SizedBox(width: 80.w,),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
