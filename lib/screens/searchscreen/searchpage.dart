import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:myfitnessapp/constants/headers.dart';
import 'package:myfitnessapp/screens/searchscreen/details.dart';
import 'package:myfitnessapp/screens/searchscreen/search.dart';
import 'package:myfitnessapp/screens/searchscreen/item_tile.dart';
import 'package:myfitnessapp/screens/dashboard/workouts.dart';
import 'package:provider/provider.dart';

import '../../model/data.dart';
import '../../model/exercises.dart';
import '../../model/exercises.dart';
import '../../model/exercises.dart';
import '../../model/exercises.dart';
import '../../model/exercises.dart';
import '../../responsive_design.dart';
import '../workoutdetailscreen/video.dart';
import 'exercisedescription.dart';
import 'exercisedescriptionpage.dart';




class dashboards extends StatefulWidget {
   dashboards({Key? key}) : super(key: key);

  @override
  State<dashboards> createState() => _dashboardsState();
}

class _dashboardsState extends State<dashboards> {
  final List exercises = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Bench", "4.00", "calpage/feed_player.mp4", Color(0xFF848C98),"exercises/shoulder.jpg"],
    ["Cardio", "2.50", "calpage/pexels-tima-miroshnichenko-5320011.mp4", Color(0xFF848C98),"exercises/cardio.jpg"],
    ["Chest", "12.80", "calpage/pexels-tima-miroshnichenko-6388436.mp4", Color(0xFF848C98),"exercises/biceps.jpg"],
    ["Back", "1.00", "calpage/video.mp4", Color(0xFF848C98),"exercises/boxing.jpg"],
    ["Legs", "1.00", "calpage/video.mp4", Color(0xFF848C98),"exercises/boxing.jpg"],
    ["Boxing", "1.00", "calpage/video.mp4", Color(0xFF848C98),"exercises/boxing.jpg"],
  ];

  int checkedIndex = 0;

  String video = "calpage/feed_player.mp4";
  var ahmed = "";




  List <String> foods= ['Vegetables', "Animal products","Fruits","Fats", "Carbohydrates"];

  String? SelectedOption = "Vegetables";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return  Container(

          //color: Color(0xFFE7E7E7),

          child: SingleChildScrollView(

            child: Consumer<CartModel>(
                builder: (context, value, child) {



              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(Responsive.isDesktop(context))
                  SizedBox(

                      height: MediaQuery.of(context).size.height * 0.10,
                      child: headers()),



                  Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [




                      Expanded(
                          flex: 3,
                          child:Column(


                            children: [

                              SizedBox(height: Responsive.isMobile(context)? _size.height * 0.05:

                              _size.height * 0.05,)
                              ,

                              Padding(
                                padding: const  EdgeInsets.symmetric(horizontal: 14.0),
                                child: Row(
                                  children: [

                                    InkWell(
                                      child: Container(
                                        width: 300,
                                        // width: Responsive.isDesktop(context)?_size.width*0.2:Responsive.isTablet(context)? _size.width*0.3 :
                                        // _size.width < 552? _size.width*0.85 :_size.width*0.7,
                                        child: TextField(


                                          decoration: InputDecoration(
                                              hintText: "Search",
                                              fillColor: secondaryColor,
                                              contentPadding: EdgeInsets.only(top: 10.0, left: 20

                                              ),
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              ),

                                              suffixIcon: Container(
                                                padding: EdgeInsets.all(defaultPadding * 0.75),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: defaultPadding / 2),
                                                decoration: BoxDecoration(
                                                  //color: primaryColor,
                                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                ),
                                                child: Icon( Icons.search),
                                              )
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Responsive.isMobile(context)? _size.height * 0.05:

                              _size.height * 0.05,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                child: Row(

                                  children: [
                                    SizedBox(
                                      width:200,
                                      child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color:Colors.grey,
                                                    width: 1),
                                                borderRadius: BorderRadius.circular(12)
                                            ),

                                          ),
                                          value : SelectedOption,
                                          items: foods.map((e) =>  DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: openSans.copyWith(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColorss.textColor,
                                                ),

                                              )
                                          )
                                          ).toList(),
                                          onChanged: (e){
                                            setState(() {
                                              SelectedOption= e;
                                            });
                                          }),
                                    )
                                    // Text("Chest Workouts",
                                    //   style: GoogleFonts.poppins(
                                    //       color: primaryColor,
                                    //       fontSize: 20, fontWeight: FontWeight.normal),
                                    // ),


                                  ],
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(

                                    left: 15.0,
                                top: 18,
                                  right: _size.width <496? 15: 15
                                ),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: exercises.length,
                                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
                                      (crossAxisCount: 1,
                                      childAspectRatio: Responsive.isMobile(context) &&_size.width
                                          > 542 ? 2.1:_size.width
                                          < 542? 2.1:    2.1,

                                    ), itemBuilder:
                                    (context,index)
                                {
                                  return featured(

                                    itemName: exercises[index][0],

                                    imagePath:exercises[index][1],
                                    color:  index == checkedIndex? Colors.brown: Colors.black,
                                    background: exercises[index][4],
                                    onPressed: (){
                                      setState(() {
                                        checkedIndex = index;

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => exercisedescription(
                                          Exercises: exercises[index][2],
                                        )));



                                      });
                                    },


                                  );

                                }

                                ),
                              ),




                            ],
                          )

                      ),

                      if(_size.width > 736)
                      Expanded(
                          flex: 5,


                        child:exercisedescription(
                          Exercises: exercises[0][2],
                        ),

                      )






                    ],
                  ),

                ],


              );
  }
            ),

          ),
        );
  }
}
