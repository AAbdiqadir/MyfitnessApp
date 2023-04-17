import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:myfitnessapp/responsive_design.dart';
import 'package:provider/provider.dart';

import '../profile&managementscreen/profile.dart';
import '../sidemenucontroller.dart';
import '../userprofile/signout.dart';

class headers extends StatelessWidget {

  const headers({Key? key,
    this.color = colors,

  this.title = "Dashboard"}) : super(key: key);



  final title;


  final  color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color:Color(0xFF043838),
            // border: Border(bottom: BorderSide(color: Color(0xFFE7E7E7),
            //   width: 1)
            // )

        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              if(!Responsive.isDesktop(context) )
              IconButton(
                color: Colors.black,
                iconSize: 30,

                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu,
                  color:colors[200],
                ),
              ),



              // Padding(
              //   padding: const EdgeInsets.only(right: 8.0),
              //   child: IconButton(onPressed: () {},
              //       icon: Icon(Icons.menu,
              //       size: 20,
              //       )
              //   ),
              // ),

              SizedBox(
                width: 10,
              ),
              Text(title,
                style: GoogleFonts.openSans(
                    color:colors[200],
                    fontSize: 20, fontWeight:  FontWeight.w500),
              )
              ,
              Spacer(),


              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => signout()));
                },
                child: Container(
                  height: double.infinity,

                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: defaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colors[200],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/user.png",
                        height: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                        child: Text("Profile",
                        style: GoogleFonts.openSans(
                        color: Color(0xFF022323),
                        fontSize: 15, fontWeight:  FontWeight.w300),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      );
  }
}
