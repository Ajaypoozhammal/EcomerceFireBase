import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommeurcefb/Design/cart.dart';
import 'package:ecommeurcefb/Design/payment.dart';
import 'package:ecommeurcefb/Toast%20msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Wishlist.dart';

class Productdetails extends StatefulWidget {
  final List<dynamic> image;
  final String name;
  final String raiting;
  final String offerprice;
  final String orginalprice;
  final String productDetails;
  final String discount;
  final String id;

  const Productdetails(
      {super.key,
      required this.image,
      required this.name,
      required this.raiting,
      required this.offerprice,
      required this.orginalprice,
      required this.productDetails,
      required this.discount,
      required this.id});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int currentindex = 0;
  bool favorite = false;
  bool looding = false;
  final FireStore = FirebaseFirestore.instance.collection("user");
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    checkfavorite();

    super.initState();
  }

  Future<void> checkfavorite() async {
    final firestoreCollection = FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('favorite');

    QuerySnapshot querySnapshot = await firestoreCollection.get();

    // Get data from docs and convert map to List

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]['id'].toString() == widget.id.toString()) {
        print("item found");
        setState(() {
          favorite = true;
        });
      } else {
        print("item not found");
      }
    }

    // print("hi"+querySnapshot.docs.map((e){});
  }

  Widget build(BuildContext context) {
    PageController controller = PageController();
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
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.image.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              child: Image.network(widget.image[itemIndex].toString()),
            ),
            options: CarouselOptions(
              height: 200.h,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: currentindex,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              onPageChanged: (index, c) {
                setState(() {
                  currentindex = index;
                });
              },
              autoPlayInterval: Duration(seconds: 1),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentindex,
            count: 5,
            effect: WormEffect(
                spacing: 8.0,
                radius: 50,
                dotWidth: 5.0,
                dotHeight: 5.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.red),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text(
              widget.name.toString(),
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                RatingBar.readOnly(
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  initialRating: 4,
                  size: 15,
                  maxRating: 5,
                ),
                SizedBox(
                  width: 170.w,
                ),
                GestureDetector(
                    onTap: () {
                      checkfavorite();
                      if (favorite == true) {
                        FireStore.doc(auth.currentUser!.uid.toString())
                            .collection("favorite")
                            .doc(widget.id.toString())
                            .delete()
                            .then(
                          (value) {
                            setState(() {
                              favorite = false;
                            });
                          },
                        ).onError((Error, StackTrace) {
                          ToastMessage()
                              .toastmessage(message: Error.toString());
                        });
                      } else {
                        FireStore.doc(auth.currentUser!.uid.toString())
                            .collection("favorite")
                            .doc(widget.id)
                            .set({
                          'id': widget.id.toString(),
                          'name': widget.name.toString(),
                          "discount": widget.discount.toString(),
                          'rating': widget.raiting.toString(),
                          'productDetails': widget.productDetails.toString(),
                          'orginal price': widget.orginalprice.toString(),
                          'offer price': widget.offerprice.toString(),
                          'images': widget.image
                        }).then(
                          (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 3),
                                behavior: SnackBarBehavior.floating,
                                content: Text('Go to Wish list'),
                                action: SnackBarAction(
                                  label: 'Wish List',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Wishlist()));
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: favorite == true
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              children: [
                Text(
                  widget.orginalprice.toString(),
                  style: GoogleFonts.montserrat(
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xFF808488),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  widget.offerprice.toString(),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  widget.discount.toString(),
                  style: GoogleFonts.montserrat(
                    color: Color(0xFFF97189),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 190, top: 10),
            child: Text(
              'Product Details',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              widget.productDetails.toString(),
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 135.w,
                  padding: const EdgeInsets.all(4),
                  color: Colors.blue,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        FireStore.doc(auth.currentUser!.uid.toString())
                            .collection("cart")
                            .doc(widget.id)
                            .set({
                          'id': widget.id.toString(),
                          'name': widget.name.toString(),
                          "discount": widget.discount.toString(),
                          'rating': widget.raiting.toString(),
                          'productDetails': widget.productDetails.toString(),
                          'orginal price': widget.orginalprice.toString(),
                          'offer price': widget.offerprice.toString(),
                          'images': widget.image
                        }).then(
                          (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 3),
                                behavior: SnackBarBehavior.floating,
                                content: Text('Go to cart'),
                                action: SnackBarAction(
                                  label: 'cart',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Cart()));
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Go to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Payment(
                                  images: widget.image,
                                  name: widget.name.toString(),
                                  offerprice: widget.offerprice.toString(),
                                  productDetails:
                                      widget.productDetails.toString(),
                                  rating: widget.raiting.toString(),
                                  discount: widget.discount.toString(),
                                  id: widget.id.toString(),
                                  orginalprice: widget.orginalprice.toString(),
                                ),),);
                  },
                  child: Container(
                    height: 40.h,
                    width: 135.w,
                    padding: const EdgeInsets.all(4),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'By Now',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
