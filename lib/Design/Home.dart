import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            Container(
              child: Banner(
                location: BannerLocation.bottomStart,
                color: Colors.red,
                message: '',
                child: Container(
                  color: Colors.green[100],
                  height: 100,
                  // child: Padding(
                  //   padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Column(
                      children: <Widget>[Image.asset("assets/d.png")],
                    ),
                  ),
                ),
              ),

            // )
          ],
        ),
      ),
    );
  }
}
