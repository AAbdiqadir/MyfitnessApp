import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class sidemenu extends StatelessWidget {
  const sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: secondaryColor,
      width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height,



              child: SingleChildScrollView(
                child: Column(


                      children: [
                        SizedBox(
                          height: 50,
                        )
                        ,
                        ListTile(
                          onTap: (){},
                          leading:  SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
                            , height: 16,
                            colorFilter: ColorFilter.mode(
                              Colors.black54,
                              BlendMode.srcIn,
                            )
                          ),


                        ),
                        ListTile(
                          onTap: (){},
                          leading: SvgPicture.asset("images/musculous-arm-silhouette-svgrepo-com.svg"
                            , height: 16,colorFilter: const ColorFilter.mode(
                                Colors.black54,
                                BlendMode.srcIn,
                              )


                          ),


                        ),
                        ListTile(
                          onTap: (){},
                          leading:  SvgPicture.asset("images/diet-svgrepo-com.svg"
                            , width: 18.0,
                              height: 18.0,
                              colorFilter: ColorFilter.mode(
                                Colors.black54,
                                BlendMode.srcIn,
                              )

                          ),

                        ),
                        ListTile(
                          onTap: (){},
                          leading:  SvgPicture.asset("images/diet-svgrepo-com.svg"
                              , width: 18.0,
                              height: 18.0,
                              colorFilter: ColorFilter.mode(
                                Colors.black54,
                                BlendMode.srcIn,
                              )

                          ),


                        ),
                        ListTile(
                          onTap: (){},
                          leading:  SvgPicture.asset("images/diet-svgrepo-com.svg"
                              , width: 18.0,
                              height: 18.0,
                              colorFilter: ColorFilter.mode(
                                Colors.black54,
                                BlendMode.srcIn,
                              )

                          ),

                        ),











                      ]
                  ),
              ),



    );







  }
}
