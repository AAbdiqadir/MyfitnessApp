import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants/navigationrail.dart';
import 'package:myfitnessapp/screens/caloriespage/lanes/leftlane.dart';
import 'package:myfitnessapp/screens/caloriespage/lanes/monthly.dart';
import 'package:myfitnessapp/screens/caloriespage/responive.dart';
import 'package:myfitnessapp/screens/caloriespage/ttcal.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../constants/headers.dart';
import '../../constants/navigationbar.dart';
import '../../constants/sidemenu.dart';
import '../../model/dailymeal.dart';
import '../../model/dailytrack.dart';
import '../../model/data.dart';
import '../../responsive_design.dart';
import '../../sidemenucontroller.dart';
import '../../userprofile/user/user_data.dart';
import '../dashboard/chart.dart';
import 'allwidgets/calchart.dart';
import 'allwidgets/containercal.dart';
import 'appbar_widget.dart';
import 'caltoday.dart';
import 'drawer.dart';
import 'lanes/centrelane.dart';
import 'allwidgets/monthlytrack.dart';
import 'package:intl/intl.dart';
class caloriespage extends StatefulWidget {
  const caloriespage({Key? key}) : super(key: key);

  @override
  State<caloriespage> createState() => _caloriespageState();
}




class _caloriespageState extends State<caloriespage> {
  bool _isHovered =false;
  var hover = "nothovered";
  double sideLength = 50;

  void ahmed(){

    var uuid = Uuid();

    String s = uuid.v4();
    print(s);


  }

  DateTime date = DateTime.now();


  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(date);

  Widget datepicker()=> SizedBox(
    height: 150,

    child: CupertinoDatePicker(
      onDateTimeChanged: (DateTime value) {
        date = value;
      },
      initialDateTime: date,
      mode: CupertinoDatePickerMode.date,

    ),
  );
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "images/avocado.png", Colors.green],
    ["Banana", "2.50", "images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "images/chicken-leg.png", Colors.brown],
    ["Water", "1.00", "images/water.png", Colors.blue],
  ];
  var selected = "Lunch";
  late List <dailymeal> meals;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        //key: context.read<MenuAppController>().scaffoldKey,

        backgroundColor: Colors.white,

        appBar:! Responsive.isDesktop(context) ? PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child:headers()

        ): null,
      //   appBar: PreferredSize(
      //     preferredSize: Size(double.infinity, 100),
      // child: (ResponsiveLayout.isTinyLimit(context) ||
      // ResponsiveLayout.isTinyHeightLimit(context))
      // ? Container(): AppBarWidget()
      //
      //   ),

        body:Container(

          child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(ResponsiveLayout.isComputer(context))
               DrawerPage(),
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Consumer<CartModel>(

                  builder: (context, value, child) {
                    Provider.of<CartModel>(context, listen: false).fetchmeals();
                    String s = DateFormat('yyyy-MM-dd').format(date);
                    meals = value.allmeals_.where((element) => element.mealfor_day.dateTime == s ).toList();
                     return Column(




                        children: [
                          if(Responsive.isDesktop(context))
                          headers(color: Colors.grey[200],),


                          Row(
                            children: [
                              Expanded(child: monthly()),


                            ],
                          )
                          ,


                          SizedBox(
                            width: Responsive.isDesktop(context)? _size.width *0.6: Responsive.isTablet(context)? _size.width *0.7: Responsive.isMobile(context)&& _size.width > 654? _size.width *0.9
                                :_size.width > 500 ? _size.width *0.7:_size.width *0.9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Expanded(child: calchart()),
                                    if(_size.width > 654)
                                    Expanded(child: caltodqqq(
                                      carbcont: 30.1,proteincont: 30.9,fatcont: 50.8,
                                    )),


                                  ],
                                ),
                                if(_size.width < 654)
                                  caltodqqq(carbcont: 30.1,proteincont: 30.9,fatcont: 50.8,),


                              ],
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: Responsive.isDesktop(context)? _size.width *0.4:_size.width *0.6 ,
                            height: 200,


                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                            child: Text(DateFormat('yyyy-MM-dd').format(date) == s? "Today": DateFormat('yyyy-MM-dd').format(date),
                                              style: _isHovered == false?   GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500
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


                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: Responsive.isMobile(context) ? MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.8 : null,
                              child:
                              meals.isNotEmpty? ListView.builder(
                                itemCount: meals.length,
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
                                          meals[index].product.image,
                                          height: 36,
                                        ),

                                        title: Text(
                                          meals[index].product.name,
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
                          SizedBox(
                            height: 200,
                          )

                        ],
                      );
  }
  )


      ),
              ),

            ],
          ),
        ),






        drawer: DrawerPage(),



      ),
    );
  }}

