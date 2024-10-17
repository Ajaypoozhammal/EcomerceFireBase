import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommeurcefb/Design/Profile.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection("favorite")
        .snapshots();
    final firestore1 = FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection("favorite");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Wishlist")),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Center(
                    child: Text("Error"),
                  );
                }
                if(snapshot.hasData){
                 return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 300 / 400,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 8.0,
                    ),
                  
                    itemCount:snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Productdetails()));},
                        child: Container(
                          height: 400.h,
                          width: 150.w,
                          decoration: ShapeDecoration(shape: OvalBorder()),
                          child: Column(
                            children: [
                              Container(height: 100.h,width: 150.w,
                                child: Image.network(
                                  snapshot.data!.docs[index]["images"][0].toString()
                                  ,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                snapshot.data!.docs[index]["name"]
                                  .toString(),
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),

                              Text(maxLines: 2,
                                snapshot.data!.docs[index]["productDetails"]
                                    .toString(),                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 10.sp,

                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 110),
                                child: Text(
                                  snapshot.data!.docs[index]["offer price"]
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  RatingBar.readOnly(
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    initialRating: double.parse(snapshot.data!.docs[index]['rating']),
                                    size: 15,
                                    maxRating: 5,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]["rating"]
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xFFA4A9B3),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),SizedBox(width: 20.w,),
                                  GestureDetector(onTap:(){
                                    firestore1.doc(snapshot.data!.docs[index]["id"].toString()).delete();
                                  } ,child:Icon(Icons.delete))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                else {
                  return SizedBox();
                }
              },

            ),
          ),
        ],
      ),
    );
  }
}
