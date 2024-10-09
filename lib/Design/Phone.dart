import 'package:ecommeurcefb/Design/Otp%20field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Toast msg.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController phone = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 80, top: 60),
              child: Text(
                'Phone',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),SizedBox(height: 70.h,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: phone,
                validator: (value) {
                  if (value == null || phone.text.length <10) {
                    return 'Enter 10 Digits';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  prefixIcon: Icon(Icons.phone),
                  labelText: "PhoneNumber",
                  fillColor: Color(0xFFFA8A8A9),
                ),
              ),
            ),
            GestureDetector(onTap: (){
              if(formkey.currentState!.validate()){
                auth.verifyPhoneNumber(
                    phoneNumber: "+91${phone.text}",
                    verificationCompleted: (_) {},
                    verificationFailed: (e) {
                      ToastMessage().toastmessage(message: e.toString());
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Otp(
                            otp: verificationId,
                          )));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      ToastMessage().toastmessage(message: e.toString());
                    });
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

