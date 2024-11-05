import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Message?"),
          content: Text(
              "This is message will be permanently delete from this collection."),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 260 / 400,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) =>
                                Productdetails(image:snapshot.data!.docs[index]["images"]
                                , name: snapshot.data!.docs[index]["name"]
                                    .toString(), raiting:  snapshot.data!.docs[index]["rating"]
                                    .toString(), offerprice:snapshot.data!.docs[index]["offer price"]
                                    .toString(), orginalprice:snapshot.data!.docs[index]["orginal price"]
                                    .toString(), productDetails:snapshot.data!.docs[index]["productDetails"]
                                    .toString(), discount: snapshot.data!.docs[index]["discount"]
                                    .toString(), id: snapshot.data!.docs[index]["id"]
                                    .toString(), )));
                          },
                          child: Container(
                            height: 400.h,
                            width: 150.w,
                            decoration: ShapeDecoration(shape: OvalBorder()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170.w,
                                  height: 124.h,
                                  child: Image.network(
                                    snapshot.data!.docs[index]["images"][0]
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    maxLines: 1,
                                    snapshot.data!.docs[index]["name"]
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),

                                Text(
                                  maxLines: 2,
                                  snapshot.data!.docs[index]["productDetails"]
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 90, top: 3),
                                  child: Text(
                                    snapshot.data!.docs[index]["offer price"]
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 15,
                                      initialRating: double.parse(snapshot
                                          .data!.docs[index]['rating']),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) =>
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
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
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          //showAlertDialog(context);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Delete Message?"),
                                                content: Text(
                                                    "This is message will be permanently delete from this collection."),
                                                actions: [
                                                  TextButton(
                                                    child: Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("Delete"),
                                                    onPressed: () {
                                                      firestore1
                                                          .doc(snapshot.data!
                                                          .docs[index]["id"]
                                                          .toString())
                                                          .delete();
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
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
