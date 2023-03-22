import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/headers.dart';
import '../constants/navigationbar.dart';
import '../responsive_design.dart';
import '../screens/caloriespage/appbar_widget.dart';
import '../screens/caloriespage/drawer.dart';
import '../screens/caloriespage/responive.dart';
import '../screens/foods/dashboard.dart';
import '../sidemenucontroller.dart';

class food extends StatelessWidget {
  const food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        //key: context.read<MenuAppController>().scaffoldKey,


        backgroundColor:Colors.white,

        appBar:! Responsive.isDesktop(context) ? PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child:headers()

        ): null,
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
                    child: dashboardss()

                ),
              ]
          ),
        ),






        bottomNavigationBar: Responsive.isMobile(context)? navbar(): null,


      ),
    );
  }
}
