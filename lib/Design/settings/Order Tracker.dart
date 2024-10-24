import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

class MyHomePage extends StatefulWidget {
  final  String satus;
  const MyHomePage({Key? key, required this.satus}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
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
  late Status status;
  @override
  void initState() {
    checkStatus();

    super.initState();
  }

  void checkStatus() {
    if (widget.satus == "Order Placed") {
      status = Status.order;
    }
    if (widget.satus == "Shipped") {
      status = Status.shipped;
    }
    if (widget.satus == "Out of delevery") {
      status = Status.outOfDelivery;
    }
    if (widget.satus == "Delivered") {
      status = Status.delivered;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: OrderTracker(
          status:status,
          activeColor: Colors.green,
          inActiveColor: Colors.grey[300],
          orderTitleAndDateList: orderList,
          shippedTitleAndDateList: shippedList,
          outOfDeliveryTitleAndDateList: outOfDeliveryList,
          deliveredTitleAndDateList: deliveredList,
        ),
      ),
    );
  }
}