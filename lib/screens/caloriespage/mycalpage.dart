import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/model/dailymeal.dart';
import 'package:myfitnessapp/model/products.dart';
import 'package:myfitnessapp/responsive_design.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../model/dailytrack.dart';
import '../../model/data.dart';
import '../caloriespage/allwidgets/containercal.dart';
import '../dashboard/chart.dart';

import 'package:intl/intl.dart';

import 'caltoday.dart';
class  meal extends StatefulWidget {

  @override
  State<meal> createState() => mealState();
}



class mealState extends State<meal> {

  DateTime date = DateTime.now();
  bool _isHovered =false;

  var selected = "Breakfast";
  late List <dailymeal> ahmed;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      height: MediaQuery.of(context).size.height*1.2 ,
      child: Container(



          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Consumer<CartModel>(


              builder: (context, value, child) {

                String s = DateFormat('yyyy-MM-dd').format(date);
                DateTime datetoday = DateTime.now();
                String m = "";

                if (s == DateFormat('yyyy-MM-dd').format(datetoday) ){
                  m = "Today";
                }
                else{
                  m =DateFormat('yyyy-MM-dd').format(date);
                }


                ahmed = value.allmeals_.where((element) => element.mealfor_day.dateTime == s ).toList();

                int total = 0;

                for (int i = 0; i <ahmed.length ;i++ ){

                  total = total + ahmed[i].product.calories;

                }




                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    MouseRegion(
                      onEnter: (event) => setState(() => _isHovered = true),
                      onExit: (event) => setState(() => _isHovered = false),

                      child: Material(
                        color: Colors.transparent,
                        child: CupertinoButton(

                          onPressed: () {
                            showCupertinoModalPopup(context: context, builder:
                                (BuildContext context)=>
                                SizedBox(
                                  height: 150,


                                  child: CupertinoDatePicker(
                                    backgroundColor: Colors.white,
                                    onDateTimeChanged: (DateTime value) {
                                      setState(() {
                                        date = value;
                                      });

                                    },
                                    initialDateTime: date,
                                    mode: CupertinoDatePickerMode.date,

                                  ),
                                )


                            );
                          },
                          child: Container(
                            width: 200,
                            //alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              // color: secondaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  child: Text(m,
                                    style: _isHovered == false?  openSans.copyWith(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColorss.textColor,
                                      ): GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),                          ),
                      ),
                    ),

                    Chart(
                      total: ahmed.isEmpty? 0: total,

                    ),


                    SizedBox(
                        width: Responsive.isDesktop(context)? _size.width *0.4:Responsive.isTablet(context)? _size.width *0.4:  _size.width *0.8,
                        child: dailycals(
                          onBreakfastTap: (){
                            setState(() {
                              selected = "Breakfast";

                              print(s);
                              print(value.allmeals_.length);




                            });
                          },
                          onLunchTap: (){
                            setState(() {
                              selected = "Lunch";
                              print(value.allmeals_.length);
                            });
                          },
                          DinnerTap: (){
                            setState(() {
                              selected = "Dinner";
                            });
                          },
                          selected: selected,
                        )),



                    Expanded(
                      child: SizedBox(
                        width: Responsive.isMobile(context) ? MediaQuery
                            .of(context)
                            .size
                            .width * 0.8 : null,
                        child:
                        ahmed.isNotEmpty? ListView.builder(
                          itemCount: ahmed.length,
                          padding: EdgeInsets.all(7),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                  leading: Image.network(
                                    ahmed[index].product.image,
                                    height: 36,
                                  ),

                                  title: Text(
                                    ahmed[index].product.name,
                                    style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black
                                    ),
                                  ),
                                  trailing: IconButton(
                                      icon: const Icon(Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {



                                        //
                                        //     Provider.of<CartModel>(context, listen: false).deleteField(ahmed[index].id);
                                        //
                                        //     print(value.dailys.length);

                                      }
                                  ),
                                ),
                              ),
                            );
                          },

                        ):
                        Container(
                          child: Center(
                              child: Text(
                                "No data available to show",
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),
                              )
                          ),
                        ),
                      ),
                    )
                    ,

                              caltodqqq(
                carbcont: 30.1,proteincont: 30.9,fatcont: 50.8,
                )],


                );

              }
          )
      ),
    );
  }
}
