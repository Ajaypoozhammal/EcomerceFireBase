import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeurcefb/Design/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Toast msg.dart';
import '../Order.dart';
import 'Edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final firestore1 = FirebaseFirestore.instance.collection('user').snapshots();
  final auth = FirebaseAuth.instance;

  int index = 0;
  Future<void> getUser(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final firestoreCollection = FirebaseFirestore.instance.collection('user');

    // Get all documents in the subcollection
    QuerySnapshot querySnapshot = await firestoreCollection.get();

    // Get data from docs and convert map to List

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]['id'].toString() ==
          auth.currentUser!.uid.toString()) {
        setState(() {
          index = i;
        });
      } else {

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:Text(
          'Settings',
          style: GoogleFonts.montserrat(
            color: Color(0xFF1D1B20),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ) ,

      ),
      body: Center(
          child: StreamBuilder<QuerySnapshot>(
              stream: firestore1,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('error'),
                  );
                }
                if (snapshot.hasData) {
                  getUser(snapshot);

                  return Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                          height: 115.h,
                          width: 115.w,
                          decoration: ShapeDecoration(
                            color: Color(0xFF477B72),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(83.64.r),
                            ),
                          ),
                          child: snapshot.data!.docs[index]["Profile"].isEmpty
                              ? Center(
                            child: Icon(Icons.person),
                          )
                              : ClipOval(
                              child: Image.network(
                                snapshot.data!.docs[index]["Profile"]
                                    .toString(),
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        snapshot.data!.docs[index]["id"].toString() ==
                            auth.currentUser!.uid.toString()
                            ? snapshot.data!.docs[index]["name"]
                            .toString()
                            : '',
                        style: GoogleFonts.plusJakartaSans(
                          color: Color(0xFF202244),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        snapshot.data!.docs[index]["id"].toString() ==
                            auth.currentUser!.uid.toString()
                            ? snapshot.data!.docs[index]["email"].toString()
                            : '',
                        style: GoogleFonts.plusJakartaSans(
                          color: Color(0xFF545454),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Edit(index: index,))),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_)=>Orders())),
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
                      SizedBox(
                        height: 20.h,
                      ),


                      GestureDetector(
                          onTap: () {
                            auth
                                .signOut()
                                .then(
                                  (value) => {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Signup()),
                                        (Route<dynamic> route) => false)
                              },
                            )
                                .onError(
                                  (error, stackTrace) => ToastMessage()
                                  .toastmessage(
                                  message: error.toString()),
                            );
                          },
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
                                        SizedBox(
                        height: 20.h,
                      ),

                    ],
                  );
                } else {
                  return SizedBox();
                }
              })) ,
    );
  }
}