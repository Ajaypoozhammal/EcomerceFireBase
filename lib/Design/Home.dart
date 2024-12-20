import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeurcefb/Design/category.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final firestore = FirebaseFirestore.instance.collection("Banner").snapshots();
  final firestore2 =
      FirebaseFirestore.instance.collection("deal of the day").snapshots();
  final firestore3 =
      FirebaseFirestore.instance.collection("categories").snapshots();

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.sort),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset("assets/a.png")),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Stylish',
                style: GoogleFonts.libreCaslonText(
                  textStyle: TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/e.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  Text(
                    'All Featured',
                    style: GoogleFonts.libreCaslonText(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Container(
                width: double.infinity,
                height: 95.h,
                color: Colors.white,
                child: StreamBuilder(
                  stream: firestore3,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Category(
                                                  product: snapshot
                                                          .data!.docs[position]
                                                      ["product"],
                                                )));
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(snapshot
                                        .data!.docs[position]['image']
                                        .toString()),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.docs[position]['name']
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Color(0xFF21003D),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, position) {
                          return SizedBox(
                            width: 1.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
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
                  return Center(child: Text("Error"));
                }
                if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: Image.network(
                          snapshot.data!.docs[itemIndex]["image"].toString()),
                    ),
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: currentIndex,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      onPageChanged: (index, c) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      autoPlayInterval: Duration(seconds: 1),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: 3,
              effect: WormEffect(
                  spacing: 8.0,
                  radius: 50.r,
                  dotWidth: 5.0.w,
                  dotHeight: 5.0.h,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.indigo),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 343.w,
              height: 70.h,
              decoration: ShapeDecoration(
                color: Color(0xFF4392F8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Deal of the Day',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.white,
                              size: 10.sp,
                            ),
                            Text(
                              '22h 55m 20s remaining ',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 70.w,
                      height: 28.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 15.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 270.h,
              width: double.infinity,
              child: StreamBuilder(
                stream: firestore2,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
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
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Productdetails(
                                            image: snapshot.data!.docs[position]
                                                ["images"],
                                            name: snapshot
                                                .data!.docs[position]["name"]
                                                .toString(),
                                            raiting: snapshot
                                                .data!.docs[position]["rating"]
                                                .toString(),
                                            offerprice: snapshot.data!
                                                .docs[position]["offer price"]
                                                .toString(),
                                            orginalprice: snapshot.data!
                                                .docs[position]["orginal price"]
                                                .toString(),
                                            productDetails: snapshot
                                                .data!
                                                .docs[position]
                                                    ["productDetails"]
                                                .toString(),
                                            discount: snapshot.data!
                                                .docs[position]["discount"]
                                                .toString(),
                                            id: snapshot
                                                .data!.docs[position]['id']
                                                .toString(),
                                          )));
                            },
                            child: Container(
                              height: 241.h,
                              width: 170.w,
                              decoration: ShapeDecoration(shape: OvalBorder()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 178.h,
                                    width: 150.w,
                                    child: Image.network(
                                      snapshot.data!.docs[position]["images"][0]
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[position]["name"]
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    maxLines: 2,
                                    snapshot
                                        .data!.docs[position]["productDetails"]
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[position]["offer price"]
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!
                                            .docs[position]["orginal price"]
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Color(0xFF808488),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        snapshot
                                            .data!.docs[position]["discount"]
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFFFE735C),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        tapOnlyMode:true ,
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
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        snapshot.data!.docs[position]["rating"]
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFFA4A9B3),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
