import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/exercises.dart';
import '../../responsive_design.dart';
import 'exercisedescription.dart';
class exercisedescription extends StatefulWidget {
   exercisedescription({Key? key,
     required this.Exercise
  }) : super(key: key);

    exercises Exercise;
  @override
  State<exercisedescription> createState() => _exercisedescriptionState();
}

class _exercisedescriptionState extends State<exercisedescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Colors.grey[300],
        appBar: Responsive.isMobile(context)? PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 0.0),
            child: Column(

              children: [
                Container(
                  color:  !Responsive.isMobile(context)? Colors.transparent: Colors.grey[300],

                  child:
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton( onPressed: () {  Get.back(
                      );
                        }, icon: Icon(Icons.arrow_back,
                          color: Responsive.isMobile(context)? Colors.black: Colors.grey[300]),)
                    ],
                  ),
                ),
              ],
            ),
          ),): null,
         body: SingleChildScrollView(child: exercisedetails(workout: widget.Exercise,)),
      ),
    );
  }
}
