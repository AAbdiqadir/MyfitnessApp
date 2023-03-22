import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class gym extends StatelessWidget {
  final String Name;
  final String Type;
  final String background;
  void Function()? onPressed;

  gym({
    super.key,
    required this.background,
    required this.Type,
    required this.Name,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
            children: <Widget>[
           Expanded(

               child: Container(

                decoration: BoxDecoration(


                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage(background),
                      fit: BoxFit.cover,


                  ),
                ),

          ),

           ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black,
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
                        Text(Name,
                          style: GoogleFonts.openSans(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[200]
                          ),
                        ),

                        Text(Type,
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[200]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
      ]
        ),
    );

  }
}
