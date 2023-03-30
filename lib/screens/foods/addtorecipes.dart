
import 'package:flutter/material.dart';
import 'package:myfitnessapp/screens/foods/foodtile.dart';

import '../../model/products.dart';
import '../../responsive_design.dart';


class addtorecipes extends StatefulWidget {
   addtorecipes({Key? key,
     required this.addrecipes
   }) : super(key: key,
  
  );

   List <Product> addrecipes = [];
  @override
  State<addtorecipes> createState() => _addtorecipesState();
}

class _addtorecipesState extends State<addtorecipes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          child:
            GridView.builder(
            shrinkWrap: true,
            itemCount: widget.addrecipes.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount: 1,//Responsive.isTablet(context) ? 2 :_size.width < 599? 2:3,
            childAspectRatio: Responsive.isTablet(context)? 2 :
        Responsive.isMobile(context)?2 :
        2,

        ), itemBuilder:
        (context,index)
        {

          return widget.addrecipes.isNotEmpty? Foodtile(
              title: widget.addrecipes[index].name,
              image: widget.addrecipes[index].image) : Container(

            child: Text(widget.addrecipes[index].name,),
          );

        }

        )
        ),
      ),
    );
  }
}
