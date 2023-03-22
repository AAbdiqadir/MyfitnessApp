import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../workoutdetailscreen/video.dart';

class details extends StatelessWidget {
  details({
    super.key,

    required this.video



  });
  final String video;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(


            children:[

            Container(
                height:_size.height *0.3

            ),
              Container(
               // height:_size.height *1,
                child: Column(

                  children: [

                    SizedBox(
                      height: _size.height *0.1,
                    ),

                    Column(
                      children: [
                        Row(
                          children:  [

                            SizedBox(
                              width: _size.width *0.02,
                            ),
                            Text("Exercise anatomy",
                              style: GoogleFonts.openSans(
                                  color:colors[200],
                                  fontSize: 20,
                                  fontWeight:  FontWeight.w500),
                            )
,

                          ],
                        ),
                        Row(
                          children: [

                             SizedBox(
                              width: _size.width *0.02,
                            ),

                            SizedBox(
                              height: _size.height *0.2,
                              width: _size.width *0.3,
                              child: Image.asset("calpage/bench press.jpg",
                                fit: BoxFit.fitWidth,
                                height: _size.height *0.2,

                              ),
                            ),


                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Berbell Preacher Curl"
                                  ),

                                ],
                              )
                              ,
                              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt "
                                  "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco "
                                  "laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in "
                                  "voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaec"
                                  "at cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    )
                  ],



                ),
              ),
  ]
          ),
        ),
      ),
    );
  }
}
