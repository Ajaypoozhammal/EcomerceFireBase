import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommeurcefb/Design/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Productdetails extends StatefulWidget {
  final List<dynamic> image;
  final String name;
  final String raiting;
  final String offerprice;
  final String orginalprice;
  final String productDetails;
  final String discount;

  const Productdetails(
      {super.key,
      required this.image,
      required this.name,
      required this.raiting,
      required this.offerprice,
      required this.orginalprice,
      required this.productDetails, required this.discount});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int currentindex = 0;

  @override
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
            itemCount:widget.image.length,
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
          ),SizedBox(height: 20.h,),
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
                Icon(Icons.favorite_border)
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
            child: Text(widget.productDetails.toString(),
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
                SizedBox(
                  width: 20.w,
                ),
                Container(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
