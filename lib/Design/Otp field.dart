import 'package:ecommeurcefb/Design/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Toast msg.dart';
import 'BottomNavigation.dart';

class Otp extends StatefulWidget {
  final String otp;
  const Otp({super.key, required this.otp});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otp=TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40, top: 50),
            child: Text(
              'otp Field',
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
SizedBox(height: 50.h,),
          OtpTextField(
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
           Padding(
             padding: const EdgeInsets.only(top: 60),
             child: GestureDetector(onTap: () async {
    final credentials = PhoneAuthProvider.credential(
    verificationId: widget.otp,
    smsCode: otp.text);
    try{
    await auth.signInWithCredential(credentials);
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Bottomnavigation()));
    }catch(e){
    ToastMessage().toastmessage(message: e.toString());
    }
    },

    child: Container(
                width: 104.w,
                height: 38.h,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: ShapeDecoration(
                  color: Color(0xFF8204FF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF8204FF)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                         ),
             ),
           ),

        ],
      ),
    );
  }
}
