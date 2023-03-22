import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../allwidgets/nutritional.dart';
import '../allwidgets/calchart.dart';
import '../constants.dart';
import '../allwidgets/monthlytrack.dart';
import '../responive.dart';
import '../../../constants.dart';
class leftlane extends StatefulWidget {
  const leftlane({Key? key}) : super(key: key);

  @override
  State<leftlane> createState() => _leftlaneState();
}

class _leftlaneState extends State<leftlane> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (ResponsiveLayout.isComputer(context))
          Container(
            color: calbg,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                color: calbg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
            ),
          ),


           Column(
            children:   [



              Container(
                color: calbg,

                height: 400,
                child: Column(
                  children: [
                    monthlytrack(aspectratio_: 1,),
                  ],
                ),
              ),

              // if(ResponsiveLayout.isPhone(context))
              //   nutrionals()
              // ,
              // calchart()

            ],
          ),


      ],
    );
  }
}
