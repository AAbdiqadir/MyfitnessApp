import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/Login.dart';
import 'package:myfitnessapp/screens/intropage/Registerpage.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../responsive_design.dart';
import 'mainpage.dart';
import 'Mmainpage.dart';
class intropage extends StatefulWidget {
  const intropage({Key? key}) : super(key: key);

  @override
  State<intropage> createState() => _intropageState();
}

class _intropageState extends State<intropage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColorss.backColor,
      body: Row(
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
              ),
            ),
          Expanded(

            child: Container(
              height: height,
              width: double.infinity,
              //margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context)? height * 0.032 : height * 0.12),

              decoration:  BoxDecoration(
                color: !Responsive.isMobile(context)? Colors.grey[300]: null,
              image: Responsive.isMobile(context)? DecorationImage(

              image: AssetImage("exercises/young-fitness-man-studio.jpg"),
              fit: BoxFit.cover,
              ):null,
              ),
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
                              SizedBox(height: Responsive.isMobile(context)? height * 0.7: height *0.5),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){

                                      Get.to(()=> mainPage(), transition: Transition.fade,
                                          duration: 1.5.seconds

                                      );
                                    },
                                    child: Container(
                                      width: Responsive.isDesktop(context)? width*0.25:Responsive.isTablet(context)? width*0.25 :width*0.8,
                                      padding:  EdgeInsets.all(Responsive.isMobile(context)?  25: 18),

                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Login",
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
                              ),

                              SizedBox(
                                height: 30,
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.to(()=> mmmainPage() ,
                                      transition: Transition.fade,
                                        duration: 1.5.seconds
                                      );


                                    },
                                    child: Container(
                                      width: Responsive.isDesktop(context)? width*0.25:Responsive.isTablet(context)? width*0.25 :width*0.8,
                                      padding:  EdgeInsets.all(Responsive.isMobile(context)?  25: 18),

                                      decoration: BoxDecoration(
                                        color: Responsive.isMobile(context)? Colors.grey[300]:Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child:  Center(
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                            color: Responsive.isMobile(context)? Colors.black: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
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
    );
  }
}
