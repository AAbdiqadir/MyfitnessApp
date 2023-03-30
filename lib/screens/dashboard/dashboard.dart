import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:myfitnessapp/constants/headers.dart';
import 'package:myfitnessapp/screens/searchscreen/item_tile.dart';
import 'package:myfitnessapp/screens/dashboard/workouts.dart';
import 'package:provider/provider.dart';

import '../../model/data.dart';
import 'chart.dart';
import '../caloriespage/chartcard.dart';
import '../../responsive_design.dart';
import '../../tiles/productfittile.dart';
import 'calorietoday.dart';
import 'foodfeature.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final List Exercises = const [

    ["Chest workouts", "Weight Lifting", "exercises/shoulder.jpg"],
    ["Back workouts",  "Weight Lifting", "exercises/biceps.jpg"],
    ["Cardio", "HIIT Workout", "exercises/cardio.jpg"],
    ["Shoulder", "Weight Lifting", "exercises/pexels-andres-ayrton-6550851.jpg"],
    ["Legs",  "Weight Lifting", "exercises/pexels-anete-lusina-4793199.jpg"],
    ["Abs",  "HIIT Workout", "exercises/pexels-julia-larson-6455946.jpg"],
  ];

  final List Foods = const [

    ["Vegetables&Fats",  "images/dish-clipart-vegetable-salad-14.png"],
    ["Animal products",  "images/ap.png"],
    ["Carbs", "images/rice.png"],

  ];
  void initState(){


      Provider.of<CartModel>(context, listen: false).fetchmeals();
      Provider.of<CartModel>(context, listen: false).fetchProducts();


    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(

      color: Color(0xFFDCDCDC),
      child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(Responsive.isDesktop(context))
              SizedBox(

                  height: MediaQuery.of(context).size.height * 0.1,
                  child: headers()),

                 SizedBox(
                   height:20,
                 ),



                 Row(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        flex: 5,
                        child:Column(

                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    width: 10,
                                  ),
                                Text("Featured",
                                style: GoogleFonts.openSans(
                                    color:Color(0xFF042A2A),
                                    fontSize: 20, fontWeight:  FontWeight.w500)
                                )
                                ],
                              ),
                            )

                            ,

                            if(!Responsive.isMobile(context))
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: Foods.length,
                                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
                                    (crossAxisCount: _size.width <504 ? 3 :3,
                                    childAspectRatio: 1/1.2,

                                  ), itemBuilder:
                                  (context,index)
                              {
                                return  FoodCard(
                                            press: () {},
                                            title: Foods[index][0],
                                            image: Foods[index][1],
                                          );

                              }

                              ),
                            ),
                            if(Responsive.isMobile(context))
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    FoodCard(
                                      press: () {
                                      },
                                      title: Foods[0][0],
                                      image: Foods[0][1],


                                    ),
                                    FoodCard(
                                      press: () {},
                                      title: Foods[1][0],
                                      image: Foods[1][1],

                                    ),
                                    FoodCard(
                                      press: () {},
                                      title: Foods[2][0],
                                      image: Foods[2][1],

                                    ),
                                  ],
                                ),
                              ),
                            )
                            ,

                            // ,
                            // Responsive(
                            //   mobile: workouts(
                            //       crossAxisCount: _size.width <650 ? 2 :4,
                            //   childAspectRatio: _size.width <650 ? 1 :1
                            //   ),
                            //   tablet: workouts(
                            //
                            //   ),
                            //   desktop: workouts(
                            //     childAspectRatio: _size.width <1293 ? 1 :1,
                            //   ),
                            //
                            // )
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Exercises",
                                      style: GoogleFonts.openSans(
                                          color:Color(0xFF042A2A),
                                          fontSize: 20, fontWeight:  FontWeight.w500)
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding:  EdgeInsets.all( 14.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                 physics: NeverScrollableScrollPhysics(),
                                  itemCount: Exercises.length,
                                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
                                    (crossAxisCount: _size.width <593 ? 2 :3,
                                    childAspectRatio: 1,

                                  ), itemBuilder:
                                  (context,index)
                              {
                                return  gym(

                                  background: Exercises[index][2],
                                  Name: Exercises[index][0],
                                  Type: Exercises[index][1],
                                  onPressed: (){

                                  },


                                );

                              }

                              ),
                            ),
                            if(!Responsive.isMobile(context))
                              SizedBox(
                                width: 30,
                              ),
                            if(Responsive.isMobile(context))
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: caltoday(),
                              )



                          ],
                        )

                    ),




                    if(!Responsive.isMobile(context))
                    Expanded

                      (
                      flex: 2,


                         child: Container(

                           child: Column(

                             children: [
                               SizedBox(
                                 height: 30,
                               ),
                               caltoday(),
                             ],
                           ),
                         )  )
                  ],
                ),

            ],


          ),

      ),
    ));
  }
}
