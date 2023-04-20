
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'chart.dart';
import 'package:intl/intl.dart';
class  caltoday extends StatefulWidget {

  @override
  State<caltoday> createState() => _caltodayState();
}



class _caltodayState extends State<caltoday> {

  DateTime date = DateTime.now();


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

          Text("Today",
            style: openSans.copyWith(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: AppColorss.textColor,
            ),),

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
                  final item = ahmed[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),

                      child: Dismissible(

                        background: Container(color: Colors.red),
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {


                            value.allmeals_.remove(item);


                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final  user = FirebaseAuth.instance.currentUser;
                            final uid = user?.uid;
                            FirebaseFirestore.instance.collection('cart').doc(uid).collection("meals").doc(item.mealfor_day.id).delete();


                          });

                          // Then show a snackbar.
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("Meal Dismissed")));
                        } ,

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

        ],


      );

    }
          )
      ),
    );
  }
}
