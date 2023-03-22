import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import '../constants.dart';
import '../responive.dart';


class nutrionals extends StatefulWidget {
  const nutrionals({Key? key}) : super(key: key);

  @override
  State<nutrionals> createState() => _nutrionalsState();
}

class _nutrionalsState extends State<nutrionals> {

  @override
  Widget build(BuildContext context) {
    return Card(
       color: Color(0xFF022323),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(



        width: double.infinity,


                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      Row(

                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: cal,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Icon(
                                  FontAwesomeIcons.house,
                                color: Color(0xFFE5C74F),
                                  size: 15,
                              ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("Calories",
                                  style: GoogleFonts.openSans(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text("2200",
                                  style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],


                      ),
                      Row(

                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: cal,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            child: Icon(
                              FontAwesomeIcons.house,
                              color: Color(0xFFE5C74F),
                              size: 15,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("Calories",
                                  style: GoogleFonts.openSans(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text("2200",
                                  style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],


                      ),




                    ],
                  ),

    // Padding(
    // padding: ResponsiveLayout.isPhone(context) ?  EdgeInsets.symmetric(
    // horizontal: 40 ): EdgeInsets.only(
    // right: 40 ),

                  // Row(
                  //
                  // children: [
                  // ListTile(
                  // leading:Container(
                  // padding: EdgeInsets.all(2),
                  // decoration: BoxDecoration(
                  // color: Color(0xFF011111),
                  // borderRadius: const BorderRadius.all(
                  // Radius.circular(10),
                  // ),
                  // ),
                  // child: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
                  // , height: 26,
                  // colorFilter: ColorFilter.mode(
                  // Color(0xFFE5C74F),
                  // BlendMode.srcIn,
                  // )
                  // ),
                  // ),
                  // title: Text("data"),
                  // ),
                  // Spacer(),
                  // ListTile(
                  // leading:Container(
                  // padding: EdgeInsets.all(2),
                  // decoration: BoxDecoration(
                  // color: Color(0xFF011111),
                  // borderRadius: const BorderRadius.all(
                  // Radius.circular(10),
                  // ),
                  // ),
                  // child: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
                  // , height: 26,
                  // colorFilter: ColorFilter.mode(
                  // Color(0xFFE5C74F),
                  // BlendMode.srcIn,
                  // )
                  // ),
                  // ),
                  // title: Text("data"),
                  // ),
                  // ],
                  // )

              //  ListTile(
              //   leading:Container(
              //     padding: EdgeInsets.all(2),
              //     decoration: BoxDecoration(
              //       color: Color(0xFF011111),
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //     child: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
              //         ,
              //         colorFilter: ColorFilter.mode(
              //           Color(0xFFE5C74F),
              //           BlendMode.srcIn,
              //         )
              //     ),
              //   ),
              //   title: Text("1990",
              //     style: GoogleFonts.poppins(
              //         color: Colors.black,
              //         fontSize: 15, fontWeight: FontWeight.bold),
              //
              //
              //   ),
              // )




      ),
    );
  }
}
