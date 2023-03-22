import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/responsive_design.dart';


import '../../constants.dart';

class FoodCard extends StatelessWidget {
  final String title;

  final String image;

  final Function()? press;

  const FoodCard({
     Key? key,
    required this.title,

    required this.image,
    required this.press

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: !Responsive.isDesktop(context)? EdgeInsets.all(5): EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),

        width: 250,
        height: 270,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height:10
            ),
             Padding(
               padding: const EdgeInsets.only(right: 7.0),
               child: SizedBox(
                 height: 150,
                 width: 160,
                // decoration: BoxDecoration(
                //  // borderRadius: BorderRadius.circular(34),
                //
                // ),

                 child: Image.asset(image,
                 fit: BoxFit.cover),
            ),
             ),
            SizedBox(
              height: 30,
            ),

            Text(title,
                style: GoogleFonts.openSans(
                    color: Color(0xFF022323),
                    fontSize: 17, fontWeight:  FontWeight.w400)
            )

          ],
        ),
      ),
    );
  }
}