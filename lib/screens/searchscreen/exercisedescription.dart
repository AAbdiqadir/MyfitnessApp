import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../model/exercises.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../caloriespage/allwidgets/calchart.dart';
import '../caloriespage/caltoday.dart';
import '../workoutdetailscreen/video.dart';




class exercisedetails extends StatefulWidget {
   exercisedetails({Key? key,
  required this.video

  }) : super(key: key);
   String video;

  @override
  State<exercisedetails> createState() => exercisedetailsState();
}


class exercisedetailsState extends State<exercisedetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height <750 ? height *2:
      Responsive.isMobile(context)&& height >750? height *1.5:height *2.5
      ,color: Colors.grey[300],

      child: Column(
        children: [
          Text("Bench press",
            style: GoogleFonts.openSans(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: AppColorss.textColor,),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: height * 0.1,

              child: videoplayer(
                video: widget.video,
              ),
            ),
          ),


          Expanded(
            flex: 5,
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.5 :width < 552? width*0.85 :width*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,


                          children: [
                           // SizedBox(height: height * 0.064),

                            SizedBox(height: height * 0.014),
                            Text("Exercise anatomy",
                              style: GoogleFonts.openSans(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                                color: AppColorss.textColor,),
                            ),

                            SizedBox(
                              height: height *0.3,
                              width: double.infinity,
                              child: Image.asset("calpage/bench press.jpg",
                                fit: BoxFit.cover,
                                height: height *0.2,

                              ),
                            ),
                            //SizedBox(height: height * 0.064),
                            Text("Description",
                              style: GoogleFonts.openSans(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: AppColorss.textColor,),
                            ),
                           // SizedBox(height: height * 0.064),
                            Text( "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam vestibulum morbi blandit cursus"
                                " risus at. Amet risus nullam eget felis eget nunc. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus. Congue nisi vitae suscipit tellus"
                                " mauris a diam. Molestie a iaculis at erat pellentesque. At tempor commodo ullamcorper a lacus vestibulum sed arcu. Convallis aenean et "
                                "tortor at risus viverra adipiscing at in. Faucibus pulvinar elementum integer enim. Aenean vel elit scelerisque mauris pellentesque pulvinar"
                                " pellentesque habitant morbi. Ante in nibh mauris cursus mattis molestie a. Felis bibendum ut tristique et egestas quis ipsum suspendisse."
                                "Sed sed risus pretium quam vulputate dignissim suspendisse in est. Sed libero enim sed faucibus turpis. Leo vel orci porta non."
                                " Sem nulla pharetra diam sit. Amet purus gravida quis blandit turpis cursus in hac. Ipsum dolor sit amet consectetur adipiscing elit ut."
                                "Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Leo a diam sollicitudin tempor.",
                              style: GoogleFonts.openSans(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: AppColorss.textColor,),
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
}