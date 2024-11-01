import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../Home.dart';

class Edit extends StatefulWidget {
  final int index;
  const Edit({super.key, required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final firestore = FirebaseFirestore.instance.collection("user");
  final firestore1 = FirebaseFirestore.instance.collection("user").snapshots();
  final auth = FirebaseAuth.instance;
  final update = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final Picker = ImagePicker();
  File? image;

  Future<void> getimage() async {
    final PickedFile =
    await Picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      } else {
        print('Not image');
      }
    });
  }

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
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Stack(
                children: [
                  CircleAvatar(
                      radius: 40.r,
                      child:
                      image != null
                          ? Image.file(
                        image!.absolute,
                        fit: BoxFit.cover,
                      )
                          : Center(child: SizedBox(),)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46, top: 50),
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.blue,
                      child: GestureDetector(onTap: (){getimage();},
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 100.h,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextFormField(
                    controller: update,
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        prefixIcon: Icon(Icons.edit))),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            // GestureDetector(onTap:()async{
            //   final firestoreCollections=FirebaseFirestore.instance
            //       .collection('Users')
            //       .doc(auth.currentUser!.uid.toString());
            //   DocumentSnapshot<Map<String, dynamic>> querySnapshot =
            //   await firestoreCollections.get();
            //   final id=DateTime.now().microsecondsSinceEpoch.toString();
            //   firebase_storage.Reference ref = firebase_storage
            //       .FirebaseStorage.instance
            //       .ref('/foldername/' + id);
            //   firebase_storage.UploadTask uploadTask =
            //   ref.putFile(image!.absolute);
            //   await Future.value(uploadTask).then(
            //         (value) async {
            //       var newurl = await ref.getDownloadURL();
            //
            //       firestore
            //           .doc(querySnapshot['id'])
            //           .update({
            //         "name": update.text.toString(),
            //         "Profile": newurl.toString()
            //       }).then(
            //             (value) => {
            //
            //
            //           update.clear(),
            //           Navigator.pop(context),
            //           setState(() {
            //             image = null;
            //           })
            //         },
            //       );
            //     },
            //   );
            // },
               GestureDetector(   onTap: () async {
                final firestoreCollections = FirebaseFirestore.instance
                    .collection('user')
                    .doc(auth.currentUser!.uid.toString());

                DocumentSnapshot<Map<String, dynamic>> querySnapshot =
                await firestoreCollections.get();
                setState(() {
                });
                final id =
                DateTime.now().microsecondsSinceEpoch.toString();
                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('/foldername/' + id);
                firebase_storage.UploadTask uploadTask =
                ref.putFile(image!.absolute);
                await Future.value(uploadTask).then(
                      (value) async {
                    var newurl = await ref.getDownloadURL();

                    firestore
                        .doc(querySnapshot['id'])
                        .update({
                      "name": update.text.toString(),
                      "Profile": newurl.toString()
                    }).then(
                          (value) => {
                        Navigator.pop(context),
                        setState(() {
                          image = null;
                        })
                      },
                    );
                  },
                );
              },
                child: Container(
                  height: 40.h,
                  width: 135.w,
                  padding: const EdgeInsets.all(4),
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Update',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}