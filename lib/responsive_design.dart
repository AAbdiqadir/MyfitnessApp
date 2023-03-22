import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// class ResponsiveLayout extends StatelessWidget {
//   final Widget mobileBody;
//   final Widget tabletBody;
//   final Widget desktopBody;
//
//   ResponsiveLayout({
//     required this.mobileBody,
//     required this.tabletBody,
//     required this.desktopBody,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < 500) {
//           return mobileBody;
//         } else if (constraints.maxWidth < 1100) {
//           return tabletBody;
//         } else {
//           return desktopBody;
//         }
//       },
//     );
//   }
// }
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later

  static bool istiny(BuildContext context)=>
      MediaQuery.of(context).size.width < 850;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}