import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
class featured extends StatelessWidget {

  final String itemName;

  final String imagePath;
  final String background;
  final color;
  void Function()? onPressed;

  featured({
    super.key,
    required this.background,

    required this.imagePath,
    required this.color,
    this.onPressed, required this.itemName
  });

  bool pressed= true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onPressed,
        child: Stack(
            children: <Widget>[
              Container(

                decoration: BoxDecoration(


                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: NetworkImage(background),
                    fit: BoxFit.cover,


                  ),
                ),

              ),
              Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          color,
                        ],
                        stops: [
                          0.0,
                          1.0
                        ])),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 28.0,
                      left: 30),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      // item image
                      // item name
                      Text(itemName,
                        style: GoogleFonts.openSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color:Colors.grey[200]
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ]
        ),
      ),
    );

  }


}