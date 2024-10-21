import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final firestore2 =
      FirebaseFirestore.instance.collection("deal of the day").snapshots();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 420.w,
          height: 50.w,
          child: TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            controller: search,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.r)),
              prefixIcon: Icon(Icons.search),
              suffix: Icon(Icons.mic)
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore2,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final name =
                          snapshot.data!.docs[index]["name"].toString();
                      if (search.text.isEmpty) {
                        return Container(
                          width: 331,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 130.h,
                                width: 130.w,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Image.network(
                                  snapshot.data!.docs[index]["images"][0]
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["name"]
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: 210.w,
                                      child: Text(
                                        maxLines: 3,
                                        snapshot
                                            .data!.docs[index]["productDetails"]
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]["offer price"]
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!
                                              .docs[index]["orginal price"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]["discount"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 60, top: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]["rating"]
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
                                          RatingBar(
                                            filledIcon: Icons.star,
                                            size: 15,
                                            emptyIcon: Icons.star_border,
                                            onRatingChanged: (value) =>
                                                debugPrint('$value'),
                                            initialRating: double.parse(snapshot
                                                .data!.docs[index]["rating"]
                                                .toString()),
                                            maxRating: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(search.text.toLowerCase().toLowerCase())) {
                        return Container(
                          width: 331,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 130.h,
                                width: 130.w,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Image.network(
                                  snapshot.data!.docs[index]["images"][0]
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["name"]
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: 210.w,
                                      child: Text(
                                        maxLines: 3,
                                        snapshot
                                            .data!.docs[index]["productDetails"]
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]["offer price"]
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!
                                              .docs[index]["orginal price"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]["discount"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 60, top: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]["rating"]
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
                                          RatingBar(
                                            filledIcon: Icons.star,
                                            size: 15,
                                            emptyIcon: Icons.star_border,
                                            onRatingChanged: (value) =>
                                                debugPrint('$value'),
                                            initialRating: double.parse(snapshot
                                                .data!.docs[index]["rating"]
                                                .toString()),
                                            maxRating: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
