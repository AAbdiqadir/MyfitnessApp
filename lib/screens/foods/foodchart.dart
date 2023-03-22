import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
class calfoodchart extends StatefulWidget {
   calfoodchart({Key? key,

    required this.calories

  }) : super(key: key);


  String calories;

  @override
  State<calfoodchart> createState() => calfoodchartState();
}

class calfoodchartState extends State<calfoodchart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      margin : EdgeInsets.all(14.0),
      child: Column(
        children: [
          Text('Total Calories',
            style: openSans.copyWith(
              fontSize: 13.0,
              fontWeight: FontWeight.w700,
              color: AppColorss.textColor,
            ),
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 50,
                    startDegreeOffset: -90,
                    sections: paiChartSelectionDatas,

                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: defaultPadding),
                      Text(
                        widget.calories,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 0.5,
                        ),
                      ),
                      // Text("of 128GB")
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

List<PieChartSectionData> paiChartSelectionDatas = [
  // PieChartSectionData(
  //   color: primaryColor,
  //   value: 25,
  //   showTitle: false,
  //   radius: 13,
  // ),
  // PieChartSectionData(
  //   color: Color(0xFF26E5FF),
  //   value: 20,
  //   showTitle: false,
  //   radius: 22,
  // ),
  // PieChartSectionData(
  //   color: Color(0xFFFFCF26),
  //   value: 10,
  //   showTitle: false,
  //   radius: 19,
  // ),
  // PieChartSectionData(
  //   color: Color(0xFFEE2727),
  //   value: 15,
  //   showTitle: false,
  //   radius: 16,
  // ),
  PieChartSectionData(
    color: calbg,
    value: 100,
    showTitle: false,
    radius: 13,
  ),
];