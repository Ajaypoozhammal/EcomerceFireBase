import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeurcefb/Design/settings/Order%20Tracker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection("Order")
        .snapshots();
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
            padding: const EdgeInsets.only(right: 180),
            child: Text(
              'Shopping List',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          StreamBuilder(
            stream: firestore,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 331,
                          height: 231,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderTrack(
                                        status: snapshot.data!.docs[position]
                                        ["status"].toString()
                                    ),));
                                  //   Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => OTK(
                                  //         status: snapshot.data!.docs[position]["status"].toString()
                                  //     ),
                                  //   ),
                                  // );
                                    },
                                    child: Container(
                                      height: 130.h,
                                      width: 130.w,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Image.network(
                                        snapshot
                                            .data!.docs[position]["images"][0]
                                            .toString(),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[position]
                                              ["name"],
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 50, top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Order date:',
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!
                                                    .docs[position]["date"]
                                                    .toString(),
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60, top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data!
                                                    .docs[position]["rating"]
                                                    .toString(),
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              RatingBar.builder(
                                                itemSize: 15,
                                                initialRating: double.parse(snapshot
                                                    .data!.docs[position]['rating']),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 64,
                                              height: 29,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 0.30,
                                                      color:
                                                          Color(0xFFCACACA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  snapshot
                                                      .data!
                                                      .docs[position]
                                                          ["offer price"]
                                                      .toString(),
                                                  style:
                                                      GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.h),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .docs[position]
                                                            ["discount"]
                                                        .toString(),
                                                    style: GoogleFonts
                                                        .montserrat(
                                                      color:
                                                          Color(0xFFEA3030),
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .docs[position]
                                                            ["orginal price"]
                                                        .toString(),
                                                    style: GoogleFonts
                                                        .montserrat(
                                                      color:
                                                          Color(0xFFA6A6A6),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20),
                                child: Divider(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Total Order (1)   :',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                    ),
                                    Text(
                                      '\$ 34.00',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, position) {
                      return SizedBox(
                        width: 15.w,
                      );
                    },
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
