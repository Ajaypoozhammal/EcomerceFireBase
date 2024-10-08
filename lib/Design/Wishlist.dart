import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommeurcefb/Design/Profile.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(onTap: (){},
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
              padding: const EdgeInsets.only(left: 10, ),
              child: Row(
                children: [
                  Text(
                    '52,082+ Iteams ',
                    style: GoogleFonts.libreCaslonText(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    width: 61,
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
            ),SizedBox(height: 10.h,),
      SizedBox(height:500.h,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:  230 / 400,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 8.0,
          ),
          padding: EdgeInsets.all(8.0),
          itemCount:38,
          itemBuilder: (context, index) {
            return GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Productdetails()));},
              child: Container(
                height: 200.h,
                width: 150.w,
                decoration: ShapeDecoration(shape: OvalBorder()),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/h.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      'HRX by Hrithik Roshan',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h,),

                    Text(
                      'Neque porro quisquam est quidolorem ipsum quia',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.h,),

                    Padding(
                      padding: const EdgeInsets.only(right: 110),
                      child: Text(
                        '₹2499',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        RatingBar(
                          filledIcon: Icons.star,size:15,
                          emptyIcon: Icons.star_border,
                          onRatingChanged: (value) => debugPrint('$value'),
                          initialRating: 3,
                          maxRating: 5,
                        ),SizedBox(width: 15.w,),
                        Text(
                          '344567',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFA4A9B3),
                            fontSize: 13.sp,
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
        ),
      ),
          ],
        ),
      ),
    );
  }
}
