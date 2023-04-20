import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/pages/Homepage.dart';
import 'package:myfitnessapp/profile&managementscreen/foodformpage.dart';
import 'package:myfitnessapp/profile&managementscreen/workoutform.dart';
import 'package:myfitnessapp/screens/caloriespage/responive.dart';

import '../../pages/Workouts.dart';
import '../../pages/searchforfoodpage.dart';
import '../../profile&managementscreen/profile.dart';
import 'caloriespage.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mealplan.dart';


class ButtonsInfo {
  String title;
  IconData icon;
  Widget page;

  ButtonsInfo({required this.title, required this.icon,
  required this.page
  });
}


int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: FontAwesomeIcons.house, page: Homepage()),
  ButtonsInfo(title: "Food", icon: FontAwesomeIcons.utensils ,page: food()),
  ButtonsInfo(title: "Exercise", icon: FontAwesomeIcons.dumbbell,page: Workouts()),
  ButtonsInfo(title: "Meal Plan", icon: FontAwesomeIcons.nutritionix, page: MealScreen()),
  ButtonsInfo(title: "Addfood", icon: FontAwesomeIcons.squarePlus, page:foodform()),
  ButtonsInfo(title: "AddWorkout", icon: FontAwesomeIcons.squarePlus, page:workout())
];

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width:220,
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.kPadding ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: _size.height*0.031,
                ),
                ListTile(
                  title: Text(
                    "",
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),
                  trailing: !ResponsiveLayout.isComputer(context)
                      ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(FontAwesomeIcons.xmark,   color: Colors.black),
                  )
                      : null,
                ),
                ...List.generate(
                  _buttonNames.length,
                      (index) => Column(

                    children: [
                      Container(
                        // decoration: index == _currentIndex
                        //     ? BoxDecoration(
                        //   borderRadius: BorderRadius.circular(20),
                        //   gradient: LinearGradient(
                        //     colors: [
                        //       // Color(0xFF022323).withOpacity(0.9),
                        //       // Color(0xFF043636).withOpacity(0.9),
                        //     ],
                        //   ),
                        // )
                        //     : null,
                        child: ListTile(
                          title: Text(
                            _buttonNames[index].title,
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: index == _currentIndex ? Color(0xFF022323): Color(
                                    0x5A0C2F2F),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Icon(
                              _buttonNames[index].icon,
                              color: index == _currentIndex ? Color(0xFF022323): Color(
                                  0x5A0C2F2F),
                            ),
                          ),
                          onTap: () {

                            //
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => _buttonNames[index].page));




                            setState(() {
                              _currentIndex = index;

                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      // Divider(
                      //   color: Colors.white,
                      //   thickness: 0.1,
                      // ),
                    ],
                  ),
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}
