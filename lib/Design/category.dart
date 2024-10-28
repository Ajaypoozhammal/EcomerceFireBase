import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  final List<dynamic> product;

  const Category({super.key, required this.product});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 200 / 400,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 8.0,
              ),
              padding: EdgeInsets.all(8.0),
              itemCount: widget.product.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Productdetails(
                                  image: widget.product[index]['image'],
                                  name:
                                      widget.product[index]['name'].toString(),
                                  raiting: widget.product[index]['raiting']
                                      .toString(),
                                  offerprice: widget.product[index]
                                          ['offerprice']
                                      .toString(),
                                  orginalprice: widget.product[index]
                                          ['orginalprice']
                                      .toString(),
                                  productDetails: widget.product[index]
                                          ['productDetails']
                                      .toString(),
                                  discount: widget.product[index]['discount'],
                                  id: widget.product[index]['id'].toString(),
                                )));
                  },
                  child: Container(
                    height: 400.h,
                    width: 150.w,
                    decoration: ShapeDecoration(shape: OvalBorder()),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180.h,
                          width: 200.w,
                          child: Image.network(
                            widget.product[index]['image'][0].toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          widget.product[index]['name'].toString(),
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          maxLines: 2,
                          widget.product[index]['productDetails'].toString(),
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Text(
                                widget.product[index]['orginalprice']
                                    .toString(),
                                style: GoogleFonts.montserrat(
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xFFA4A9B3),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                widget.product[index]['offerprice'].toString(),
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                widget.product[index]['discount'].toString(),
                                style: GoogleFonts.montserrat(
                                  color: Color(0xFFFE735C),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            RatingBar.readOnly(
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              initialRating: double.parse(
                                widget.product[index]['raiting'].toString(),
                              ),
                              size: 15,
                              maxRating: 5,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              widget.product[index]['raiting'].toString(),
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
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
