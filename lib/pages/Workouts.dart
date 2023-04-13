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

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(


       // key: context.read<MenuAppController>().scaffoldKey,

        appBar:! Responsive.isDesktop(context) ? const PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child:headers(title: "Exercise",)

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
