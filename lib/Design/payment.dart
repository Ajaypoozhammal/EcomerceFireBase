import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeurcefb/Design/Order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Toast msg.dart';
import 'Wishlist.dart';

class Payment extends StatefulWidget {
  final List<dynamic> images;
  final String name;
  final String offerprice;
  final String productDetails;
  final String rating;
  final String discount;
  final String id;
  final String orginalprice;

  const Payment(
      {super.key,
      required this.images,
      required this.name,
      required this.offerprice,
      required this.productDetails,
      required this.rating,
      required this.discount,
      required this.id,
      required this.orginalprice});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int currentindex = 0;
  bool favorite = false;
  bool looding = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestorecollection = FirebaseFirestore.instance.collection('user');
  final date = DateTime.now().add(Duration(days: 7));

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    firestorecollection
        .doc(auth.currentUser!.uid.toString())
        .collection("Order")
        .doc(widget.id)
        .set({
      'id': widget.id.toString(),
      'date':
          '${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}',
      'status': 'shipped',
      'name': widget.name.toString(),
      "discount": widget.discount.toString(),
      'rating': widget.rating.toString(),
      'productDetails': widget.productDetails.toString(),
      'orginal price': widget.orginalprice.toString(),
      'offer price': widget.offerprice.toString(),
      'images': widget.images
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text('Go to order'),
          action: SnackBarAction(
            label: 'order',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Orders()));
            },
          )));
    });
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
            onTap: () {
              checkfavorite();
              if (favorite == true) {
                firestorecollection.doc(auth.currentUser!.uid.toString())
                    .collection("favourite")
                    .doc(widget.id.toString())
                    .delete()
                    .then(
                      (value) {
                    ToastMessage().toastmessage(
                        message: 'Remove favourite');
                    setState(() {
                      favorite = false;
                    });
                  },
                ).onError((Error, StackTrace) {
                  ToastMessage()
                      .toastmessage(message: Error.toString());
                });
              } else {
                firestorecollection.doc(auth.currentUser!.uid.toString())
                    .collection("favorite")
                    .doc(widget.id)
                    .set({
                  'id': widget.id.toString(),
                  'name': widget.name.toString(),
                  "discount": widget.discount.toString(),
                  'rating': widget.rating.toString(),
                  'productDetails': widget.productDetails.toString(),
                  'orginal price': widget.orginalprice.toString(),
                  'offer price': widget.offerprice.toString(),
                  'images': widget.images
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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 130.h,
                    width: 130.w,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Image.network(
                      widget.images[0].toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 200.w,
                        child: Text(
                          widget.productDetails.toString(),
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Delivery by ',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            '${date.day.toString()} ${DateFormat('MMM').format(date)} ${date.year.toString()}',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
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
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Icon(Icons.library_books_outlined),
                  Text(
                    'Apply Coupons',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Text(
                    'Select',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFF73658),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 100),
              child: Text(
                'Order Payment Details',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Order Amounts',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Text(
                    widget.offerprice.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                children: [
                  Text(
                    'Convenience',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Know More',
                    style: GoogleFonts.montserrat(
                      color: Colors.redAccent,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    'Apply Coupon',
                    style: GoogleFonts.montserrat(
                      color: Colors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                children: [
                  Text(
                    'Delivery Fee',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 130.w,
                  ),
                  Text(
                    'Fee',
                    style: GoogleFonts.montserrat(
                      color: Colors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                children: [
                  Text(
                    'Order Total',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 140.w,
                  ),
                  Text(
                    widget.offerprice.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EMI Available',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.montserrat(
                      color: Colors.redAccent,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: 351.w,
              height: 130.h,
              decoration: ShapeDecoration(
                color: Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Column(
                      children: [
                        Text(
                          widget.offerprice.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'View Details',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFF73658),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Razorpay razorpay = Razorpay();
                      var options = {
                        'key': 'rzp_test_gKANZdsNdLqaQs',
                        'amount': 100,
                        'name': 'Acme Corp.',
                        'description': 'Fine T-Shirt',
                        'retry': {'enabled': true, 'max_count': 1},
                        'send_sms_hash': true,
                        'prefill': {
                          'contact': '8888888888',
                          'email': 'test@razorpay.com'
                        },
                        'external': {
                          'wallets': ['paytm']
                        }
                      };
                      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                          handlePaymentErrorResponse);
                      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                          handlePaymentSuccessResponse);
                      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                          handleExternalWalletSelected);
                      razorpay.open(options);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 140,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF73658),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            'Proceed to Payment',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
