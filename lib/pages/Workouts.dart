import 'package:flutter/material.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:myfitnessapp/constants/sidemenu.dart';
import 'package:myfitnessapp/screens/caloriespage/drawer.dart';

import 'package:myfitnessapp/screens/searchscreen/filter.dart';
import 'package:provider/provider.dart';

import '../constants/headers.dart';
import '../constants/navigationbar.dart';
import '../responsive_design.dart';
import '../screens/dashboard/dashboard.dart';
import '../screens/searchscreen/searchpage.dart';
import '../sidemenucontroller.dart';
import '../userprofile/user/user_data.dart';
class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(


       // key: context.read<MenuAppController>().scaffoldKey,

        appBar:! Responsive.isDesktop(context) ?  PreferredSize(
            preferredSize: const Size(double.infinity, 80),
            // child:headers(title: "Exercise", name : )
            child:headers( title: "Exercise", name : UserData.current.name)
        ): null,
        // appBar: AppBar(
        //
        //
        // ),
        drawer: DrawerPage(),
        body:SafeArea(


          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [

                if(Responsive.isDesktop(context))
                  Expanded(





                    child: DrawerPage(),
                  ),
                Expanded(
                    flex: 5,
                    child: dashboards()

                ),
              ]
          ),
        ),








      ),
    );
  }
}
