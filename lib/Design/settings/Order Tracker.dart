import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderTrack extends StatefulWidget {
  final String status;
  const OrderTrack({super.key, required this.status});


  @override
  State<OrderTrack> createState() => _OrderTrackState();

}


//ordertracking
class _OrderTrackState extends State<OrderTrack> {
  late Status traking;
  void Checkorderplaced (){
    if(widget.status=="orderplaced"){
      setState(() {
        traking= Status.order;
      });
    }
    else if (widget.status=="shipped"){
      setState(() {
        traking= Status.shipped;
      });
    }
    else if (widget.status== "outofDelivery"){
      setState(() {
        traking =Status.outOfDelivery;
      });
    }else {
      setState(() {
        traking=Status.delivered;
      });
    }
  }
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),

  ];
  @override
  void initState() {
    Checkorderplaced ();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Track Your Order",
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Color(0xFF4392F9),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              )
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: OrderTracker(
              status: traking,
              activeColor: Colors.green,
              inActiveColor: Colors.grey[300],
              orderTitleAndDateList: orderList,
              shippedTitleAndDateList: shippedList,
              outOfDeliveryTitleAndDateList: outOfDeliveryList,
              deliveredTitleAndDateList: deliveredList,
            ),
          ),
        ],
      ),
    );
  }
}