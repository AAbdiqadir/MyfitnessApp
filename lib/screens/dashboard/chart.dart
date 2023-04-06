import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class Chart extends StatelessWidget {
   Chart({
    Key? key,
    required this.total,
  }) : super(key: key);
  int total;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
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
                  total.toString() ,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),

               Text("Calories",
                 style: Theme.of(context).textTheme.headline4!.copyWith(
                 color: Colors.black,
                 fontWeight: FontWeight.w300,
                 fontSize: 15
               ),
               )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [


  PieChartSectionData(
    color:Color(0xFF043838),
    value: 100,
    showTitle: false,
    radius: 13,
  ),
];