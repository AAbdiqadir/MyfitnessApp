

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override


  int selectedindex =0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: GNav(
        rippleColor: Color(0xFF43423D), // tab button ripple color when pressed
        hoverColor: Color(0xFFF8F8F8), // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
        tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
        tabShadow: [BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)], // tab button shadow
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.black, // unselected icon color
        activeColor: Colors.purple, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // na
         tabs: [

           GButton(icon: Icons.home,
           text: "home",
           ),
           GButton(icon: Icons.sports_gymnastics,
             text: "gym",
           ),
           GButton(icon: Icons.dashboard,
             text: "dashboard",),
           GButton(icon: Icons.account_circle,
             text: "user",
           ),



         ],
        // items: [
        //   BottomNavigationBarItem(icon: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
        //       , height: 16,
        //       colorFilter: ColorFilter.mode(
        //         Colors.black54,
        //         BlendMode.srcIn,
        //       )
        //   ),
        //       label: ""),
        //   BottomNavigationBarItem(icon: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
        //       , height: 16,
        //       colorFilter: ColorFilter.mode(
        //         Colors.black54,
        //         BlendMode.srcIn,
        //       )
        //   ),label: ""),
        //   BottomNavigationBarItem(icon: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
        //       , height: 16,
        //       colorFilter: ColorFilter.mode(
        //         Colors.black54,
        //         BlendMode.srcIn,
        //       )
        //   ),label: "")
        // ],
      ),
    );
  }
}
