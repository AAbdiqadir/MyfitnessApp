import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/responsive_design.dart';


import '../../constants.dart';

class Foodtile extends StatelessWidget {
  final String title;
  final String ?ingredient;
  final String image;
  final int ?price;
  final String? calories;
  final String ?description;
  final Function()? press;
  final color;
  final textcolor;

  const Foodtile({
    Key? key,
    required this.title,
    this.ingredient,
    required this.image,
    this.price,
    this.calories,
    this.description,
    this.press,
    this.color = Colors.grey,
    this.textcolor = calbg

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: !Responsive.isDesktop(context)? EdgeInsets.all(5): EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color[200],
        ),

        width: 250,
        height: 270,

        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Container(
                decoration: BoxDecoration(
              //    color: colors[200],

                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.white10),
                  image:DecorationImage(
                      image: NetworkImage(image,



                      ),
                      fit: BoxFit.cover
                  ),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 70,
                  // decoration: BoxDecoration(
                  //  // borderRadius: BorderRadius.circular(34),
                  //
                  // ),

                 // child: Image.network(image,





                ),
              ),
            ),


            Text(title,
                style: GoogleFonts.openSans(
                    color: Color(0xFF022323),
                    fontSize: 13, fontWeight:  FontWeight.w400)
            )

          ],
        ),
      ),
    );
  }
}