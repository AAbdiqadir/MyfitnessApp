import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';

import '../../constants.dart';
import '../../model/products.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'fooddescriptionpage.dart';




class Fooddetailpage2 extends StatefulWidget {
   Fooddetailpage2({Key? key
  ,
    required this.product
  }) : super(key: key);

  Product product ;
  @override
  State<Fooddetailpage2> createState() => Fooddetailpage2State();
}

class Fooddetailpage2State extends State<Fooddetailpage2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: Responsive.isMobile(context)? PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              color: Colors.transparent,
              // color:  !Responsive.isMobile(context)? Colors.black: Colors.grey[300],
              child:
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton( onPressed: () {  Get.back(
                    );}, icon: Icon(Icons.arrow_back,
                        color: Responsive.isMobile(context)? Colors.black: Colors.grey[300]),)
                  ],
                ),
              ),
            ),
          )


      ): null,
      body: SingleChildScrollView(child: Container(
          height: widget.product.type == "Recipe" ? height * 2.5:height * 1.4,
          child: fooddetails(Productdetail: widget.product,)))
    );
  }
}