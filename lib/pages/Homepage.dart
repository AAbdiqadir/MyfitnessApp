
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:myfitnessapp/constants/headers.dart';
import 'package:myfitnessapp/constants/sidemenu.dart';
import 'package:myfitnessapp/responsive_design.dart';
import 'package:myfitnessapp/screens/caloriespage/drawer.dart';

import 'package:myfitnessapp/responsive_design.dart';
import 'package:provider/provider.dart';
import '../constants/navigationbar.dart';
import '../model/data.dart';
import '../screens/caloriespage/appbar_widget.dart';
import '../screens/caloriespage/responive.dart';
import '../screens/dashboard/dashboard.dart';
import '../sidemenucontroller.dart';
import '../tiles/productfittile.dart';
import '../userprofile/user/user_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "images/avocado.png", Colors.green],
    ["Banana", "2.50", "images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "images/chicken-leg.png", Colors.brown],
    ["Water", "1.00", "images/water.png", Colors.blue],
  ];

  @override
  void initState() {
    // TODO: implement initState
    UserData().fetchuser();
    super.initState();
  }

  void main(){

    print(_shopItems.length);

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,

       // key: context.read<MenuAppController>().scaffoldKey,

          appBar:! Responsive.isDesktop(context) ? PreferredSize(
            preferredSize: Size(double.infinity, 80),
        child:headers()

          ): null,

        //drawer: SideMenu(),
        // appBar: AppBar(
        //
        //
        // ),
        //bottomNavigationBar: Responsive.isMobile(context)? navbar():null,
        drawer: ! Responsive.isDesktop(context)? DrawerPage(): null,
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
                        child: dashboard()

                      ),
        ]
                  ),
         ),








      ),
    );

  }
}
