import 'package:ecommeurcefb/Design/Start.dart';
import 'package:ecommeurcefb/Design/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    visible = false;
    visible2 = false;
    super.initState();
  }

  TextEditingController password = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool visible = false;
  bool visible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 80, top: 10),
                  child: Text(
                    'Create an\n account\n',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
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
                        prefixIcon: Icon(Icons.person),
                        labelText: "username or Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: !visible2,
                    controller: password,
                    validator: (value) {
                      if (value == null || password.text.length < 6) {
                        return 'Enter 6 Digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "password",
                      suffix: GestureDetector(onTap: (){setState(() {
                        visible2=!visible2;
                      });},
                          child: Icon(visible2?Icons.remove_red_eye_outlined:Icons.visibility_off)),
                      fillColor: Color(0xFFFA8A8A9),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: !visible,
                    controller: confirmpassword,
                    validator: (value) {
                      if (value == null ||
                          confirmpassword.text != password.text) {
                        return 'Enter 6 Digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Confirm Password",
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          child: Icon(visible
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off)),
                      fillColor: Color(0xFFFA8A8A9),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Row(
                    children: [
                      Text(
                        'By clicking the',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFF575757),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        'Register',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  ' button you agree to  the public offer',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
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
                        'Create Account',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '- OR Continue with -',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset("assets/c.png"),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Start()));
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              border: Border.all(color: Colors.red)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(Icons.phone_android_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'I Already Have an Account',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFF575757),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Login()));
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}