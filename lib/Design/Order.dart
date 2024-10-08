import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
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
          Container(
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
                    Container(
                      height: 130.h,
                      width: 130.w,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Image.asset(
                        "assets/i.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Women’s Casual Wear',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 90, top: 5),
                            child: Text(
                              'Order date:',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60, top: 5),
                            child: Row(
                              children: [
                                Text(
                                  '4.8',
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
                                  initialRating: 3,
                                  maxRating: 5,
                                )
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
                                        width: 0.30, color: Color(0xFFCACACA)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '\$ 34.00',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      'upto 33% off  ',
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFFEA3030),
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      '\$ 64.00',
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFFA6A6A6),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
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
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,top:20),
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
        ],
      ),
    );
  }
}
