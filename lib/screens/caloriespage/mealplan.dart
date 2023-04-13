import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../pages/Homepage.dart';
import '../../profile&managementscreen/forgotpassword.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:firebase_auth/firebase_auth.dart';




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
          appBar: Responsive.isMobile(context) ? PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  color: !Responsive.isMobile(context) ? Colors.black : Colors
                      .grey[300],
                  child:
                  Column(
                    children: [
                      // SizedBox(
                      //   height:  height*0.05,
                      // ),
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
                                  SizedBox(height: Responsive.isMobile(context)
                                      ? height * 0.1
                                      : height * 0.1,

                                    child: Container(

                                      decoration: BoxDecoration(

                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))
                                      ),
                                      child: Center(

                                        child: Lottie.network(
                                            "https://assets7.lottiefiles.com/packages/lf20_ucbyrun5.json",
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
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

                                            Text('Sign in',
                                              style: openSans.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                                color: AppColorss.textColor,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.02),
                                            Text('Enter your details',
                                              style: openSans.copyWith(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: AppColorss.textColor,
                                              ),
                                            ),

                                            SizedBox(
                                                height: ahmed == true ? height *
                                                    0.02 : null),

                                            if(ahmed == true)
                                              Text('Wrong credentials',
                                                style: openSans.copyWith(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red,
                                                ),

                                              ),
                                            SizedBox(height: height * 0.064),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  textfields(
                                      field: "Email",
                                      vontroller: emailController,
                                      obsecure: false,
                                      onvalidate: (email) =>
                                      email != null && !EmailValidator.validate(
                                          emailController.text) ?
                                      'Enter Email Correctly' : null
                                  ),
                                  SizedBox(height: height * 0.014),
                                  textfields(
                                    field: "Password", vontroller: password,
                                    obsecure: true,

                                  ),

                                  SizedBox(height: height * 0.03),

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

                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(() => forgotpassword(),
                                                arguments: "login",

                                              );
                                            },
                                            child: Text('Forgot Password?',
                                              style: openSans.copyWith(
                                                fontSize: 15.0,
                                                color: AppColorss.mainBlueColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: height * 0.05),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          signIn();
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
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Sign In",
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
                                  const SizedBox(height: 50),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Container(
                                      width: Responsive.isDesktop(context)
                                          ? width * 0.4
                                          : Responsive.isTablet(context)
                                          ? width *
                                          0.4
                                          : width * 0.7,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              thickness: 0.5,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              'Not a member?',
                                              style: TextStyle(
                                                  color: Colors.grey[700]),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              'Register now',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              thickness: 0.5,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

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