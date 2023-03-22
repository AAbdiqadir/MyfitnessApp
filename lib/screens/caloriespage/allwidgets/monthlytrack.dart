import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/caloriespage/lanes/centrelane.dart';
import 'package:myfitnessapp/screens/caloriespage/responive.dart';
import 'package:myfitnessapp/screens/caloriespage/ttcal.dart';


import '../../../constants.dart';
import '../../../constants/headers.dart';
import '../caltoday.dart';
class monthlytrack extends StatefulWidget {
  const monthlytrack({Key? key,
    required this.aspectratio_ }) : super(key: key);

  final double aspectratio_;
  @override
  State<monthlytrack> createState() => _monthlytrackState();
}

class _monthlytrackState extends State<monthlytrack> {


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [

        Row(
          children: [
            // headers(color: calbg),
            SizedBox(
              height: 100,
            ),

            Text("Progress",
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 15, fontWeight: FontWeight.normal),
            ),
            Spacer(),
            Text("Monthly",
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Expanded(
                 flex: 1,
                  child: Container(


                    height: 200,

                    color: Color(0xFFE5C74F),

                    child:Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
                              , height: 26,
                              colorFilter: ColorFilter.mode(
                                Colors.black54,
                                BlendMode.srcIn,
                              )
                          ),

                          Text("Avg cal",
                            style: GoogleFonts.openSans(
                                color: Colors.black54,
                                fontSize: 11, fontWeight: FontWeight.normal),
                          ),
                          Text("1990",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),

                        ],
                      ),
                    ),
                    ),

              ),


              Expanded(
                  flex: 2,
                  child: centrallane())

              // Expanded(
              //   flex: 2,
              //   child: AspectRatio(
              //     aspectRatio: _size.width> 1604 ? 2: _size.width< 910? 2: 1.2,
              //     child: Container(
              //
              //       color: Color(0xFF022323),
              //
              //       child:Column(
              //       children: [
              //
              //             Flexible(child:
              //             ListTile(
              //               leading:SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
              //                   , height: 26,
              //                   colorFilter: ColorFilter.mode(
              //                     Color(0xFFE5C74F),
              //                     BlendMode.srcIn,
              //                   )
              //               ),
              //               title: Text("data"),
              //             ),
              //             ),
              //             Flexible(child: ListTile(
              //               leading:SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
              //                   , height: 26,
              //                   colorFilter: ColorFilter.mode(
              //                     Color(0xFFE5C74F),
              //                     BlendMode.srcIn,
              //                   )
              //               ),
              //               title: Text("1990",
              //                 style: GoogleFonts.poppins(
              //                     color: Colors.black,
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               ),
              //             )
              //             ),
              //         Flexible(child: ListTile(
              //           leading:Container(
              //             padding: EdgeInsets.all(10),
              //             decoration: BoxDecoration(
              //               color: Color(0xFFF5FAFF),
              //               borderRadius: const BorderRadius.all(
              //                 Radius.circular(10),
              //               ),
              //             ),
              //             child: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
              //                 ,
              //                 colorFilter: ColorFilter.mode(
              //                   Color(0xFFE5C74F),
              //                   BlendMode.srcIn,
              //                 )
              //             ),
              //           ),
              //           title: Text("1990",
              //             style: GoogleFonts.poppins(
              //                 color: Colors.black,
              //                 fontSize: 15, fontWeight: FontWeight.bold),
              //
              //
              //           ),
              //         )
              //         )
              //           ],
              //       ),
              //
              //     ),
              //   ),
              // ),


            ],
          ),

        SizedBox(
          height: 50,
        ),
        //ttl()

        // if(_size.width < 921)
        //   storage()


      ],
    );
  }
}
