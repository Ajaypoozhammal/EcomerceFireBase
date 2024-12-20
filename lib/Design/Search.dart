import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeurcefb/Design/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final firestore2 =
      FirebaseFirestore.instance.collection("deal of the day").snapshots();
  SpeechToText _speechToText = SpeechToText();
  final TextEditingController search = TextEditingController();
  var islistening = false;
  bool speachEnabled = false;

  void _initSpeech() async {
    speachEnabled = await _speechToText.initialize();
    print('init');
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
    print('start');
  }

  void _stopListening() async {
    print('stop');
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      search.text = result.recognizedWords;
    });
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 420.w,
          height: 70.w,
          child: TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            controller: search,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.r)),
              prefixIcon: Icon(Icons.search),
              suffix: GestureDetector(
                onTap: _speechToText.isNotListening
                    ? _startListening
                    : _stopListening,
                child: CircleAvatar(
                  radius: 23.r,
                  backgroundColor: Colors.black,
                  child: Center(
                    child: Icon(
                      _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore2,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final name =
                          snapshot.data!.docs[index]["name"].toString();
                      if (search.text.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Productdetails(
                                    image: snapshot.data!.docs[index]["images"],
                                    name: snapshot.data!.docs[index]["name"]
                                        .toString(),
                                    raiting: snapshot
                                        .data!.docs[index]["rating"]
                                        .toString(),
                                    offerprice: snapshot
                                        .data!.docs[index]["offer price"]
                                        .toString(),
                                    orginalprice: snapshot
                                        .data!.docs[index]["orginal price"]
                                        .toString(),
                                    productDetails: snapshot
                                        .data!.docs[index]["productDetails"]
                                        .toString(),
                                    discount: snapshot
                                        .data!.docs[index]["discount"]
                                        .toString(),
                                    id: snapshot.data!.docs[index]["id"]
                                        .toString(),
                                  ),

                                ),
                              );
                            },
                            child: Container(
                              width: 331,
                              height: 150,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Row(
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
                                    child: Image.network(
                                      snapshot.data!.docs[index]["images"][0]
                                          .toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]["name"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50.h,
                                          width: 210.w,
                                          child: Text(
                                            maxLines: 3,
                                            snapshot.data!
                                                .docs[index]["productDetails"]
                                                .toString(),
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          snapshot
                                              .data!.docs[index]["offer price"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data!
                                                  .docs[index]["orginal price"]
                                                  .toString(),
                                              style: GoogleFonts.montserrat(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.black,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              snapshot
                                                  .data!.docs[index]["discount"]
                                                  .toString(),
                                              style: GoogleFonts.montserrat(
                                                color: Colors.red,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60, top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              RatingBar.builder(
                                                ignoreGestures: true,
                                                itemSize: 15.sp,
                                                initialRating: double.parse(
                                                    snapshot.data!.docs[index]
                                                        ['rating']),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.docs[index]["rating"]
                                                    .toString(),
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(search.text.toLowerCase().toLowerCase())) {
                        return Container(
                          width: 331,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Row(
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
                                child: Image.network(
                                  snapshot.data!.docs[index]["images"][0]
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index]["name"]
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: 210.w,
                                      child: Text(
                                        maxLines: 3,
                                        snapshot
                                            .data!.docs[index]["productDetails"]
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]["offer price"]
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!
                                              .docs[index]["orginal price"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]["discount"]
                                              .toString(),
                                          style: GoogleFonts.montserrat(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 60, top: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]["rating"]
                                                .toString(),
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          RatingBar.builder(
                                            itemSize: 15,
                                            initialRating: double.parse(snapshot
                                                .data!.docs[index]['rating']),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
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
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
