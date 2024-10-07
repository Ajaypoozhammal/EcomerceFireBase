import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              child: Image.asset('assets/i.png'),
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
              'NIke Sneakers',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: RatingBar(
              filledIcon: Icons.star,
              size: 20.sp,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) => debugPrint('$value'),
              initialRating: 3,
              maxRating: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              children: [
                Text(
                  '₹2,999',
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
                  '₹1,500',
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
                  '50% Off',
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
              "Perhaps the most iconic sneaker of all-time, this original"
              "Chicago? colorway is the cornerstone to anysneaker collection. Made famous in 1985 by Michael Jordan, the shoe hasstood the test of time, becoming themost famous colorway of the Air Jordan 1. This 2015 release saw the",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
              width: 136,
              height: 40,
              color: Colors.blueAccent,
              decoration: ShapeDecoration(
                color: Color(0xFFFFCCD4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      'Go to cart',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
          ),
          Container(
            width: 136,
            height: 40,
            color: Colors.blueAccent,
            decoration: ShapeDecoration(
              color: Color(0xFFFFCCD4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    'By Now',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
