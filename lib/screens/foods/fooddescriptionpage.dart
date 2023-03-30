import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../model/dailytrack.dart';
import '../../model/data.dart';
import '../../model/products.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../caloriespage/allwidgets/calchart.dart';
import '../caloriespage/caltoday.dart';
import 'foodchart.dart';
import 'nutritionaldescription.dart';




class fooddetails extends StatefulWidget {
   fooddetails({Key? key,
       required this.Productdetail,
   }) : super(key: key);

   Product Productdetail;


  // Product product = Product(name: "Vegan salad bowl",
  //     image: "images/banana.png",
  //     calories: 20,
  //     fatcont: 30,
  //     carbcont: 50,
  //     proteincont: 70, type: 'Breakfast', ServingSize: '2 tbsp', noofServings: '12');


  @override
  State<fooddetails> createState() => fooddetailsState();
}





class fooddetailsState extends State<fooddetails> {

  late int proteincont = widget.Productdetail.proteincont;
  late int carbcont = widget.Productdetail.carbcont;
  late int fatcont = widget.Productdetail.fatcont;
  late int total = proteincont+carbcont+fatcont;



  List <String> meals= ["Breakfast", "Lunch","Dinner"];

  String ?SelectedOption = "Breakfast";

  int selectedvalue = 1;

  List<int> noofserving= [1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: height <750 ? height *2:
        Responsive.isMobile(context)&& height >750? height *1.2:height *1.5
        ,


        width: double.infinity,
        //margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context)? height * 0.032 : height * 0.12),
        color: Colors.grey[300],
        child: SizedBox(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(

                child: Column(

                  children: [
                      Center(
                        child: Text(widget.Productdetail.name.toString()
                        ,
                          style: openSans.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: AppColorss.textColor,
                          ),),
                      )
                  ,
                    SizedBox(height: Responsive.isMobile(context)? height * 0.005:

                    height * 0.005,),
                    SizedBox(height: Responsive.isMobile(context)? height * 0.2:

                    height * 0.2,
                      child: Container(
                        decoration: BoxDecoration(
                          //    color: colors[200],

                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white10),
                          image:DecorationImage(
                              image: NetworkImage(widget.Productdetail.image,



                              ),
                              fit: BoxFit.cover
                          ),
                        ),
                        child: SizedBox(
                          height: double.infinity,
                          width: Responsive.isMobile(context)? width*0.5: width*0.3,
                          // decoration: BoxDecoration(
                          //  // borderRadius: BorderRadius.circular(34),
                          //
                          // ),

                          // child: Image.network(image,





                        ),
                      ),
                    ),
                SizedBox(height: Responsive.isMobile(context)? height * 0.07:

                height * 0.07,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [

                              Text('Serving size',
                                style: openSans.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorss.textColor,
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color:  AppColorss.textColor.withOpacity(0.1),
                                  border: Border.all(color:Colors.black,
                                  width: 1),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0,
                                  top:5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "2"
                                  ,
                                    style: openSans.copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [

                              Text('Number of serving',
                                style: openSans.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorss.textColor,
                                ),
                              ),
                              Spacer(),



                              CupertinoButton(

                                onPressed: (){
                                  showCupertinoModalPopup(context: context, builder:
                                  (_)=>
                                      SizedBox(
                                        width: double.infinity,
                                        height: 250,
                                        child: CupertinoPicker(
                                          itemExtent: 30,
                                          backgroundColor: Colors.grey[200],
                                          onSelectedItemChanged: (int value) {
                                            setState(() {
                                              selectedvalue = value;
                                            });
                                          }, children: const [
                                            Text("1"),
                                          Text("2"),
                                          Text("3"),
                                          Text("4"),
                                          Text("5"),
                                          Text("6"),


                                        ],
                                          scrollController: FixedExtentScrollController(
                                            initialItem: 1
                                          ),


                                        ),

                                      ),

                                  );
                                },
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                      color:  AppColorss.textColor.withOpacity(0.1),
                                      border: Border.all(color:Colors.black,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0,
                                      top:5,
                                      bottom: 5,
                                      right: 0
                                    ),
                                    child: Text( (selectedvalue ).toString(),
                                      style: openSans.copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColorss.textColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),



                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                          child: Row(


                            children: [

                              Text('Type',
                                style: openSans.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColorss.textColor,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width:150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color:Colors.grey,
                                              width: 1),
                                          borderRadius: BorderRadius.circular(12)
                                      ),

                                    ),
                                    value : SelectedOption,
                                    items: meals.map((e) =>  DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e.toString(),
                                          style: openSans.copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColorss.textColor,
                                          ),

                                        )
                                    )
                                    ).toList(),
                                    onChanged: (e){
                                      setState(() {
                                        SelectedOption= e;
                                      });
                                    }),
                              ),
                              SizedBox(height: height * 0.064),


                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(child: calfoodchart(calories: widget.Productdetail.calories.toString(),)),
                              // if(width > 654)
                              //   Expanded(child: caltodqqq()),


                            ],
                          ),
                          // if(width < 654)
                         totalnutrients(carbcont: (carbcont/total), proteincont: (proteincont/total), fatcont: (fatcont/total))


                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            DateTime now = DateTime.now();

                            String s = DateFormat('yyyy-MM-dd').format(now);
                            print(s);

                            var uuid = Uuid();

                            String DOCID = uuid.v4();
                            dailytrack daily = dailytrack( meal: SelectedOption.toString(),
                                noofServings:  selectedvalue.toString(),
                                dateTime: s, id: DOCID, Productid: widget.Productdetail.FoodID);

                            Provider.of<CartModel>(context, listen: false).addmeal(daily, DOCID);

                          },
                          child: Container(
                            width: Responsive.isDesktop(context)? width*0.3:Responsive.isTablet(context)? width*0.3 :width*0.7,
                            padding: const EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Add to meals",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                    ,


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}