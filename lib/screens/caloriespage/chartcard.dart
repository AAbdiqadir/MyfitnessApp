import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../../../../constants.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    required this.title,
    required this.image,
    required this.total,

     this.percent = 0.5

  }) : super(key: key);

  final String title, image, total;

  double percent;
  //final Color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(

        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
      Container(
            padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: cal,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
                  , height: 20,
                  colorFilter: ColorFilter.mode(
                    Color(0xFFE5C74F),
                    BlendMode.srcIn,
                  )
              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,
                      vertical: 8
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.openSans(
                            color: Colors.black,

                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text (total,

                          style: GoogleFonts.openSans(
                            color: Colors.black,



                          ),)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex:3,
                        child: LinearPercentIndicator(

                          lineHeight: 4.0,
                          percent: percent,
                          animation: true,
                          animationDuration: 2000,
                          barRadius: Radius.circular(10),
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                        ),


                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}