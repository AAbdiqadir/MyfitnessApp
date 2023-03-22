import 'package:flutter/material.dart';
import 'package:myfitnessapp/screens/caloriespage/ttcal.dart';

import '../../../constants.dart';
import '../allwidgets/nutritional.dart';
import '../allwidgets/linechart.dart';
class centrallane extends StatefulWidget {
  const centrallane({Key? key}) : super(key: key);

  @override
  State<centrallane> createState() => _centrallaneState();
}

class _centrallaneState extends State<centrallane> {
  @override
  Widget build(BuildContext context) {
    return

          Container(
            //


              child: Column(
                children:   [
                  Container(


                    child: Column(
                      children: [



                        Container(


                          color: Color(0xFF022323),


                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,


                            children: [
                              nutrionals(),
                              nutrionals(),
                              nutrionals()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),




                 // LineChartSample2()

                  // ttl()


                ],
            ),
          );



  }
}
