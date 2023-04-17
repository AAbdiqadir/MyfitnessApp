
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';
import 'package:string_validator/string_validator.dart';

import '../../constants.dart';
import '../../responsive_design.dart';
import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  String ?x =Get.arguments;
  Future Signup() async{
    BuildContext dialogContext;

    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context)

        {
          dialogContext = context;
          return Center(
            child: CircularProgressIndicator(),
          );

        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: password.text.trim()
          

          
          

          
          
      );
    } on FirebaseAuthException catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString())));
    }

    //Navigator.of(dialogContext).pop();
    //
    Navigator.pop(context);
    //  navigatorKey.currentState!.popUntil((route))=>route.isFirst;


  }
  final  emailController = TextEditingController();
  final password = TextEditingController();
  final cmpassword = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();

  void pass(){

    if (emailController.text.trim().length> 7 ){

    }

    }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: Responsive.isMobile(context)? PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                color:  !Responsive.isMobile(context)? Colors.black: Colors.grey[300],
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


        ): null,
        body: Form(
          key: formkey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(!Responsive.isMobile(context))
                Expanded(

                  child: Container(
                      height: height,
                      width: double.infinity,


                    decoration: BoxDecoration(
                      image:DecorationImage(
                          image: AssetImage("exercises/young-fitness-man-studio.jpg",



                          ),
                          fit: BoxFit.cover
                      ),
                      // height: height,


                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                                        width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text('Register',
                                              style: openSans.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                                color: AppColorss.textColor,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.02),
                                            Text('Create an account.',
                                              style: openSans.copyWith(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: AppColorss.textColor,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.064),


                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  textfields(field: "Username", vontroller: emailController,
                                      obsecure: false,
                                      onvalidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email.';
                                        }
                                        return null;
                                      }
                                  ),
                                  textfields(field: "Phone", vontroller: emailController,
                                      obsecure: false,
                                      onvalidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email.';
                                        }
                                        return null;
                                      }
                                  ),
                                  textfields(field: "Email", vontroller: emailController,
                                    obsecure: false,
                                    onvalidate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email.';
                                      }
                                      return null;
                                    }
                                  ),

                                  SizedBox(height: height * 0.014),
                                  textfields(field: "Password", vontroller: password,
                                    obsecure: true,
                                    onvalidate: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                    }
                                    return null;
                                    },
                                  ),
                                  SizedBox(height: height * 0.014),
                                  textfields(field: "Confirm Password", vontroller: cmpassword,
                                    obsecure: true,
                                    onvalidate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      } else if (value != password.text ) {
                                        return 'Password is not the same';
                                      }

                                      return null;
                                    },
                                  ),
                                  SizedBox(height: height * 0.014),


                                  SizedBox(height: height * 0.05),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: (){

                                           if (formkey.currentState!.validate()) {
                                           // isAlpha(emailController.text +
                                           // password.text) ) {
                                           // updateUserValue(
                                           //     firstNameController.text +
                                           //         " " +
                                           //         secondNameController.text);
                                           Signup ();
                                        }
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
                                              "Sign up",
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
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Container(
                                      width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width*0.7,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              thickness: 0.5,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: Text(
                                              'Already a member?',
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                           TextButton(
                                             onPressed: (){

                                               if(x == "login"){
                                                 Get.back();}
                                               else{
                                                 Get.to(()=> LoginScreen(),  arguments: "register",
                                                     );

                                               }

                                               // Get.to(()=> LoginScreen(), transition: Transition.rightToLeftWithFade,
                                               // duration: 1.seconds);
                                             },
                                             child: Text(
                                              'Login now',
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
                                  SizedBox(height: height * 0.2),
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
        ),
      ),
    );
  }
}