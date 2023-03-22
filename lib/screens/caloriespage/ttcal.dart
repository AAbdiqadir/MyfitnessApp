import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'caloriespage.dart';

class ttl extends StatefulWidget {
  const ttl({Key? key}) : super(key: key);

  @override
  State<ttl> createState() => _ttlState();
}

class _ttlState extends State<ttl> {
  @override
  Widget build(BuildContext context) {
    return  Container(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

               Padding(
                 padding: const EdgeInsets.only(right: 20.0),
                 child: Container(
                     color: Color(0xFF022323),

                        child: Row(
                          children: [


                            Expanded(
                                flex: 1,
                                child:Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                    color: Colors.cyan,
                                    height: 210,
                                    width: 220,

                            ),
                                )),
                            Expanded(
                                flex: 1,
                                child:Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                    color: Colors.black,
                                    height: 210,
                                    width: 220,

                                    child: Column(

                                      children: [

                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5FAFF),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
                                                  ,
                                                  colorFilter: ColorFilter.mode(
                                                    Color(0xFFE5C74F),
                                                    BlendMode.srcIn,
                                                  )
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text("data"),
                                                Text("data")
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),


                                  ),
                                )),



                            // Container(
                            //   height: 150,
                            //   width: 400,
                            //   color: Color(0xFF022323),
                            // ),
                          ],
                        ),

                    ),
               ),


              ],
            ),

        );
  }
}
