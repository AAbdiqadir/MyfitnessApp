import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/profilescreen/cardinfotile.dart';

class userprofile extends StatefulWidget {
  const userprofile({Key? key}) : super(key: key);

  @override
  State<userprofile> createState() => _userprofileState();
}


class _userprofileState extends State<userprofile> {

  PlatformFile? pickedFile;
  Future selectedFile() async{
    final result = await FilePicker.platform.pickFiles();

    if(result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }
  File ?image;
  Future imagepicked() async{

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image == null) return;


    final temp = File(image.path);
    this.image = temp;



  }




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: Responsive.isMobile(context) ? PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              color: !Responsive.isMobile(context) ? Colors.black : Colors
                  .grey[300],
              child:Column(
                children: [
                  SizedBox(
                    height:  height*0.05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: () {
                        Get.back(
                        );
                      }, icon: Icon(Icons.arrow_back,
                          color: Responsive.isMobile(context)
                              ? Colors.black
                              : Colors.grey[300]),)
                    ],
                  ),
                ],
              ),

            ),
          )


      ) : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(!Responsive.isMobile(context))
            Expanded(

              child: Container(

                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "exercises/young-fitness-man-studio.jpg",


                      ),
                      fit: BoxFit.cover
                  ),
                  // height: height,


                ),
                width: double.infinity,
                height: height,


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(
                      child:
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),


                          IconButton(onPressed: () {}, icon: Icon(Icons
                              .arrow_back,
                              color: Colors.grey[300]

                          ))
                        ],
                      ),
                    )
                  ],

                ),


              ),
            ),
          Expanded(

            child: Container(
              height: height,
              width: double.infinity,
              //margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context)? height * 0.032 : height * 0.12),
              color: Colors.grey[300],
              child: SingleChildScrollView(

                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Expanded(
                        child: SizedBox(

                          child: Column(

                            children: [
                              SizedBox(height: Responsive.isMobile(context)
                                  ? height * 0.1
                                  : height * 0.2),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(

                                    width: 150,
                                    height: 150,
                                    child: image != null? ClipRRect
                                      (
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.file(image!,
                                          fit: BoxFit.cover,
                                        )): ClipRRect
                                      (
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset("exercises/shoulder.jpg",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height*0.05,
                              ),

                              cardinfo(

                                signout: "open gallery",
                                ontap: (){
                                  imagepicked();
                                  //FirebaseAuth.instance.signOut();
                                },
                              ),
                              SizedBox(
                                height: height*0.02,
                              ),

                              cardinfo(

                                signout: "Sign out",
                                ontap: (){
                                  //imagepicked();
                                  FirebaseAuth.instance.signOut();
                                },
                              ),
                              SizedBox(
                                height: height*0.02,
                              ),






                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                    },
                                    child: Container(
                                      width: Responsive.isDesktop(context)
                                          ? width * 0.4
                                          : Responsive.isTablet(context)
                                          ? width * 0.4
                                          : width * 0.7,
                                      padding: const EdgeInsets.all(25),

                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Edit profile",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              )
                              ,


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}