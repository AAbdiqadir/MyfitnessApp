import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../constants/headers.dart';
import '../../pages/Homepage.dart';
import '../../profile&managementscreen/forgotpassword.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../userprofile/user/user_data.dart';
import '../dashboard/calorietoday.dart';
import 'drawer.dart';
import 'mycalpage.dart';




class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final emailController = TextEditingController();
  final password = TextEditingController();
  String ?x = Get.arguments;
  bool ahmed = false;

  Future signIn() async {
    BuildContext dialogContext;

    // showDialog(context: context,
    //     barrierDismissible: false,
    //
    //     builder: (BuildContext context)
    //
    // {  dialogContext = context;
    //
    //
    //   return Center(
    //     child: CircularProgressIndicator(
    //     ),
    //   );
    //
    // });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: password.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("wrong credentials")));
    }

    //Navigator.of(dialogContext).pop();
    //
    //Navigator.pop(context);
    //  navigatorKey.currentState!.popUntil((route))=>route.isFirst;

    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    password.dispose();
    super.dispose();
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar:! Responsive.isDesktop(context) ? PreferredSize(
              preferredSize: Size(double.infinity, 80),
              child:headers(name: "Ahmey",)

          ): null,
          drawer: DrawerPage(),
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
                        SizedBox(
                          height: !Responsive.isMobile(context)
                              ? height * 0.05
                              : null,
                        ),

                        Container(
                          child:
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),


                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.arrow_back,
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
                                  SizedBox(
                                    height: !Responsive.isMobile(context)
                                        ? height * 0.2
                                        : null,
                                  ),




                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: Responsive.isDesktop(context)
                                            ? width * 0.4
                                            : Responsive.isTablet(context)
                                            ? width * 0.4
                                            : width < 552
                                            ? width * 0.85
                                            : width *
                                            0.7,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [

                                            meal(),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),



                                  SizedBox(height: height * 0.05),




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
          )


      ),
    );
  }
}