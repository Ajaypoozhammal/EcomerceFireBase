import 'package:ecommeurcefb/Design/Start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController Email = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 80, top: 30),
              child: Text(
                'Forgot \npassword?\n',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: Email,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    prefixIcon: Icon(Icons.email),
                    labelText: "Enter your Email"),
              ),
            ),
            Text(
              ' We will send you a message to set or reset \n your new password',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height:60.h,),
            GestureDetector(onTap: (){
              if(formkey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Start()));
              }
            },
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
                    'Submit',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500)),
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
