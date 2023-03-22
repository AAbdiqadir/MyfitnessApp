
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  late List <dailytrack> ahmed;

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
     //ahmed = value.meals.where((element) => element.dateTime == s && element.meal== selected).toList();
     

      return Column(
        children: [
          SizedBox(
            height: 20,
          ),

          Text("Today",
            style: openSans.copyWith(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: AppColorss.textColor,
            ),),

          Chart(
          total: 202.2,

          ),


          SizedBox(
              width: Responsive.isDesktop(context)? _size.width *0.4:Responsive.isTablet(context)? _size.width *0.4:  _size.width *0.8,
              child: dailycals(
      onBreakfastTap: (){
      setState(() {
      selected = "Breakfast";

      });
      },
      onLunchTap: (){
      setState(() {
      selected = "Lunch";
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
              value.shopItems.isNotEmpty? ListView.builder(
                itemCount: value.shopItems.length,
                padding: EdgeInsets.all(7),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.shopItems[index][2],
                          height: 36,
                        ),

                        title: Text(
                          value.shopItems[index][0],
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

        ],


      );

    }
          )
      ),
    );
  }
}
