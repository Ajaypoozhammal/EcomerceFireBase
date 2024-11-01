import 'package:ecommeurcefb/Design/Forgot%20password.dart';
import 'package:ecommeurcefb/Design/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Toast msg.dart';
import 'BottomNavigation.dart';
import 'Phone.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signinwithgoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Bottomnavigation()));
        ToastMessage().toastmessage(message: 'succusfully completed');
      }
    } catch (e) {
      ToastMessage().toastmessage(message: e.toString());
    }
  }

  @override
  void initState() {
    visible3 = false;
    super.initState();
  }

  TextEditingController password = TextEditingController();
  TextEditingController Email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  bool visible3 = false;

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
                  padding: const EdgeInsets.only(right: 80, top: 30),
                  child: Text(
                    'Welcome \nBack!\n',
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
                        prefixIcon: Icon(Icons.person),
                        labelText: "username or Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: !visible3,
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
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible3 = !visible3;
                            });
                          },
                          child: Icon(visible3
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off)),
                      fillColor: Color(0xFFFA8A8A9),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Forgot()));
                    },
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      auth
                          .signInWithEmailAndPassword(
                              email: Email.text, password: password.text)
                          .then((value) => {
                                ToastMessage().toastmessage(
                                    message: 'Successfully registerd'),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Bottomnavigation()))
                              })
                          .onError((error, stackTrace) => ToastMessage()
                              .toastmessage(message: error.toString()));
                      ;
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
                        'Login',
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
                  height: 50.h,
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
                Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {
                              signinwithgoogle();
                            },
                            child: Image.asset("assets/c.png")),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Phone()));
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                            border: Border.all(color: Colors.red)),
                        child: Center(child: Icon(Icons.phone_android_outlined)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create An Account',
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
                            MaterialPageRoute(builder: (_) => Signup()));
                      },
                      child: Text(
                        'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
