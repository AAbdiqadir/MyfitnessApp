import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:firebase_auth/firebase_auth.dart';


class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => forgotpasswordState();
}

class forgotpasswordState extends State<forgotpassword> {
  final  emailController = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: Responsive.isMobile(context)? PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              color:  !Responsive.isMobile(context)? Colors.black: Colors.grey[300],
              child:
              Column(
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


      ): null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(!Responsive.isMobile(context))
            Expanded(

              child: Container(

                decoration: BoxDecoration(
                  image:DecorationImage(
                      image: AssetImage("exercises/young-fitness-man-studio.jpg",



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


                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,
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
                              SizedBox(height: Responsive.isMobile(context)? height * 0.1:height * 0.1,


                              ),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text('Forgot Password',
                                          style: openSans.copyWith(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700,
                                            color: AppColorss.textColor,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.02),
                                        Text('Enter your Email',
                                          style: openSans.copyWith(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColorss.textColor,
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              textfields(field: "Email", vontroller: emailController,
                                obsecure: false,
                              ),


                              SizedBox(height: height * 0.03),




                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){

                                      FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                                    },
                                    child: Container(
                                      width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width*0.7,
                                      padding: const EdgeInsets.all(25),

                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Reset Password",
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