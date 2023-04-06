
import 'package:flutter/material.dart';

import '../../../constants.dart';
var index= "Breakfast";
class dailycals extends StatefulWidget {
   dailycals({Key? key,
    this.onBreakfastTap,
    this.onLunchTap,
    this.DinnerTap,
     this.selected,

  }) : super(key: key);
  void Function()? onBreakfastTap;
  void Function()? onLunchTap;
  void Function()? DinnerTap;
  var selected;

  @override
  State<dailycals> createState() => _dailycalsState();
}

class _dailycalsState extends State<dailycals> {
  List<Color> ahmed=  [
   Colors.grey,Colors.red,Colors.black
  ];


  @override
  Widget build(BuildContext context) {
    return Container(


      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: widget.onBreakfastTap
                        ,
                        child: Container(
                          decoration: widget.selected == "Breakfast"? BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey
                          ): null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0,
                                vertical: 5),
                            child: Text("Breakfast",
                              style: openSans.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: widget.selected == "Breakfast"? Colors.white: AppColorss.textColor,
                              ),),
                          ),
                        ),
                      ),
                    )),
                    Expanded(child: InkWell(
                      onTap:  widget.onLunchTap
                      ,
                      child: Container(
                        decoration: widget.selected == "Lunch"? BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey
                        ): null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0,
                              vertical: 5),
                          child: Text("Lunch",
                            style: openSans.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: widget.selected == "Lunch"? Colors.white: AppColorss.textColor,
                          ),),
                        ),
                      ),
                    )),
                    Expanded(child: InkWell(
                      onTap:  widget.DinnerTap
                      ,
                      child: Container(
                        decoration: widget.selected == "Dinner"? BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey
                        ): null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0,
                              vertical: 5),
                          child: Text("Dinner",
                            style: openSans.copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: widget.selected == "Dinner"? Colors.white: AppColorss.textColor,
                            ),),
                        ),
                      ),
                    )),

                  ],
                ),
              ),
            ),
          ),

          // Expanded(
          //   child: InkWell(
          //     child: Container(
          //       color: Colors.red,
          //
          //
          //     ),
          //     onTap: () {
          //       setState(() {
          //        // _currentIndex = index;
          //       });
          //     },
          //   ),
          //
          // ),


        ],
      ),


    );
  }
}
