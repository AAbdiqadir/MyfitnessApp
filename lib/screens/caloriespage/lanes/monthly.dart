import 'package:flutter/material.dart';
import 'package:myfitnessapp/responsive_design.dart';
import 'package:myfitnessapp/screens/caloriespage/caltoday.dart';
import 'package:myfitnessapp/screens/caloriespage/lanes/centrelane.dart';

import '../../../constants.dart';
import '../allwidgets/nutritional.dart';
import '../allwidgets/linechart.dart';
import '../allwidgets/monthlytrack.dart';
class monthly extends StatefulWidget {
  const monthly({Key? key}) : super(key: key);

  @override
  State<monthly> createState() => monthlyState();
}

class monthlyState extends State<monthly> {

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return Stack(

        children: [


          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
                children:   [



                  Container(
                    color: calbg,
                    width: double.infinity,


                    child: Column(
                      children: [

                        SizedBox(
                          width: Responsive.isTablet(context)&&_size.width > 927 ? _size.width *0.8: Responsive.isTablet(context) && _size.width < 927? _size.width *0.9 : Responsive.isMobile(context)?  _size.width *0.8:


                          _size.width *0.7,
                          child: Row(
                            children: [

                              Expanded(child: monthlytrack(aspectratio_: 1,)),
                              // Expanded(child: centrallane()),
                              if(!Responsive.isMobile(context))
                              Expanded(child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),

                                  LineChartSample2(),
                                ],
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        if(Responsive.isMobile(context))
                          SizedBox(
                              width: _size.width*0.85,

                              child: LineChartSample2()),
                      ],
                    ),
                  ),

                  //caltodqqq()


                ],
              ),
          ),


        ],


    );
  }
}
