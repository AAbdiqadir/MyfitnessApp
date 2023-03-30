import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/responsive_design.dart';


import '../../constants.dart';

class Foodtile extends StatefulWidget {
  final String title;
  final String ?ingredient;
  final String image;
  final int ?price;
  final String? calories;
  final String ?description;
  final Function()? press;
  final color;
  final textcolor;
  void Function(bool?)? onchanged;
  bool?  value;
   Foodtile({
    Key? key,
    required this.title,
    this.ingredient,
    required this.image,
    this.price,
    this.calories,
    this.description,
    this.press,
    this.color = Colors.grey,
    this.textcolor = calbg,
    this.onchanged,
     this.value,


  }) : super(key: key);

  @override
  State<Foodtile> createState() => _FoodtileState();
}

class _FoodtileState extends State<Foodtile> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: !Responsive.isDesktop(context)? EdgeInsets.all(5): EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.color[200],
        ),

        width: 250,
        height: 270,

        // child:CheckboxListTile(
        //   title: Text("Ahmed"),
        //
        //   value: _isChecked,
        //   onChanged: (bool? newValue) {
        //     setState(() {
        //       _isChecked = newValue!;
        //     });
        //   },
        // //  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        // ) ,


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
                      image: NetworkImage(widget.image,



                      ),
                      fit: BoxFit.cover
                  ),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 50,

                ),
              ),
            ),


            Text(widget.title,
                style: GoogleFonts.openSans(
                    color: Color(0xFF022323),
                    fontSize: 13, fontWeight:  FontWeight.w400)
            ),

            Spacer(),
            Checkbox(
              // checkColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              value: widget.value ?? widget.value ,
              onChanged: widget.onchanged
            )
          ],

        )
      ),
    );
  }
}