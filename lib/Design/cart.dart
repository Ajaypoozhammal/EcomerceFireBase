import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: Text("Cart")),
      ),
      body: Column(
        children: [
          Expanded(
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
    );
  }
}
