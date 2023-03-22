import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive_design.dart';
class cardinfo extends StatelessWidget {
   cardinfo({Key? key,
  this.ontap,
     this.signout = "card"
  }) : super(key: key);

  void Function()? ontap;
  String signout;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Responsive.isDesktop(context)
            ? width * 0.3
            : Responsive.isTablet(context)
            ? width * 0.4
            : width <678? width * 0.7: width * 0.5,
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: AppColorss.textColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          signout,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }}
