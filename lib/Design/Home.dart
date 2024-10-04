import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
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
          CircleAvatar(
            backgroundImage: AssetImage("assets/e.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFFBBBBBB),
                    ),
                    suffix: Icon(
                      Icons.mic,
                      color: Color(0xFFBBBBBB),
                    ),
                    hintText: ('Search any Product..'),
                    hintStyle: GoogleFonts.libreCaslonText(
                      textStyle: TextStyle(
                        color: Color(0xFFBBBBBB),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
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
                  Container(
                    width: 71,
                    height: 29,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 16,
                          offset: Offset(1, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Sort',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Image.asset("assets/f.png")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 71,
                    height: 29,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 16,
                          offset: Offset(1, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'filter',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(Icons.filter_alt_outlined)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 75.h,
                color: Colors.white,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/e.png"),
                      ),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return SizedBox(
                      width: 1.w,
                    );
                  },
                ),
              ),
            ),
            CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                child: Image.asset('assets/g.png'),
              ),
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: currentIndex,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false
                ,
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
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: 3,
                effect:  WormEffect(
                    spacing:  8.0,
                    radius:  50,
                    dotWidth:  10.0,
                    dotHeight:  10.0,
                    paintStyle:  PaintingStyle.stroke,
                    strokeWidth:  1.5,
                    dotColor:  Colors.grey,
                    activeDotColor:  Colors.indigo
                ),
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
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150,),
                      child: Text(
                        'Deal of the Day',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Container(
                        width: 89.w,
                        height: 28.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Center(
                          child: Row(
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
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.white,
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
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 210.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return Container(
                    height: 88.h,
                    width: 150.w,
                    decoration: ShapeDecoration(shape: OvalBorder()),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/h.png",
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'HRX by Hrithik Roshan',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Neque porro quisquam est quidolorem ipsum quia',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            '₹2499',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '₹4999',
                              style: GoogleFonts.montserrat(
                                decoration: TextDecoration.lineThrough,
                                color: Color(0xFF808488),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),SizedBox(width: 10.w,),
                            Text(
                              '50%Off',
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
                            RatingBar(
                              filledIcon: Icons.star,size:10,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) => debugPrint('$value'),
                              initialRating: 3,
                              maxRating: 5,
                            ),SizedBox(width: 15.w,),
                            Text(
                              '344567',
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
                  );
                },
                separatorBuilder: (context, position) {
                  return SizedBox(
                    width: 15.w,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
