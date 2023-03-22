import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/screens/intropage/widgets/textfields.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../responsive_design.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../model/data.dart';
import '../model/products.dart';
import '../sidemenucontroller.dart';


class foodform extends StatefulWidget {
  const foodform({Key? key}) : super(key: key);

  @override
  State<foodform> createState() => foodformState();
}

class foodformState extends State<foodform> {
  final  name = TextEditingController();
  final image = TextEditingController();
  final  proteincont = TextEditingController();
  final calories = TextEditingController();
  final  fatcont = TextEditingController();
  final carbcont = TextEditingController();
  final Type = TextEditingController();
  final  Serving = TextEditingController();
  final NumberofServing = TextEditingController();



  Future <void> adddata() async{


    if(name.text.trim().isEmpty||image.text.trim().isEmpty||proteincont.text.trim().isEmpty||
        calories.text.trim().isEmpty|| fatcont.text.trim().isEmpty||carbcont.text.trim().isEmpty) {

      return;
    }

    BuildContext dialogContext;

    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context)

        {
          dialogContext = context;
          return Center(
            child: CircularProgressIndicator(),
          );

        });


    var uuid = Uuid();

    String DOCID = uuid.v4();


     Product products = Product(name: name.text.trim(), image: image.text.trim(),
         calories: int.parse(calories.text.trim()), fatcont: int.parse(fatcont.text.trim()),
         carbcont: int.parse(carbcont.text.trim()), proteincont: int.parse(proteincont.text.trim()),
         type: Type.text.trim(), ServingSize: carbcont.text.trim(), noofServings: carbcont.text.trim(),
          FoodID: DOCID
     );

     Provider.of<CartModel>(context, listen: false).addfood(products,DOCID );
    // name.clear();
    // image.clear();
    // proteincont.clear();
    // calories.clear();
    // fatcont.clear();
    // carbcont.clear();
    // Type.clear();
    // Serving.clear();
    // NumberofServing.clear();


     Navigator.pop(context);



  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    image.dispose();
    proteincont.dispose();
    calories.dispose();
    fatcont.dispose();
    carbcont.dispose();
    super.dispose();

  }

  bool ahmed = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      key: context.read<MenuAppController>().scaffoldKey,
      appBar: Responsive.isMobile(context)? PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              color:  !Responsive.isMobile(context)? Colors.black: Colors.grey[300],
              child:
              Column(
                children: [

              SizedBox(height: Responsive.isMobile(context)? height * 0.01:height * 0.01)
                 ,
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton( onPressed: () {  Get.back(
                      );}, icon: Icon(Icons.arrow_back,
                          color: Responsive.isMobile(context)? Colors.black: Colors.grey[300]),)
                    ],
                  ),
                ],
              ),
            ),
          )


      ): null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(!Responsive.isMobile(context))
            Expanded(

              child: Container(

                decoration: BoxDecoration(
                  image:DecorationImage(
                      image: AssetImage("exercises/young-fitness-man-studio.jpg",



                      ),
                      fit: BoxFit.cover
                  ),
                  // height: height,


                ),
                width: double.infinity,
                height: height,


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(
                      child:
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),


                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,
                              color: Colors.grey[300]

                          ))
                        ],
                      ),
                    )
                  ],

                ),



              ),
            ),
          Expanded(

            child: Container(
              height: height,
              width: double.infinity,
              //margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context)? height * 0.032 : height * 0.12),
              color: Colors.grey[300],
              child: SingleChildScrollView(

                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Expanded(
                        child: SizedBox(

                          child: Column(

                            children: [




                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text('Enter Food description',
                                          style: openSans.copyWith(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700,
                                            color: AppColorss.textColor,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.02),

                                        SizedBox(height: height * 0.064),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              textfields(field: "Name", vontroller: name,
                                obsecure: false,
                              ),
                              SizedBox(height: height * 0.014),
                              textfields(field: "Image",vontroller: image,
                                obsecure: false,

                              ), SizedBox(height: height * 0.014),

                              textfields(field: "Calories", vontroller: calories,
                                obsecure: false,
                                onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                    'Enter password correctly':null,
                              ),
                              SizedBox(height: height * 0.014),

                              textfields(field: "Fat content", vontroller: fatcont,
                                obsecure: false,
                                onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                'Enter password correctly':null,
                              ),
                              SizedBox(height: height * 0.014),

                              textfields(field: "Carb content", vontroller: carbcont,
                                obsecure: false,
                                onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                'Enter password correctly':null,
                              ),
                              SizedBox(height: height * 0.014),

                              textfields(field: "Protein content", vontroller: proteincont,
                                obsecure: false,
                                onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                'Enter password correctly':null,
                              ),
                              SizedBox(height: height * 0.014),
                              textfields(field: "Type", vontroller: Type,
                                obsecure: false,

                              ),
                              textfields(field: "Serving", vontroller: Serving,
                                obsecure: false,

                              ),
                              textfields(field: "Number of Serving", vontroller: NumberofServing,
                                obsecure: false,

                              ),


                              SizedBox(height: height * 0.05),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      adddata();
                                      setState(() {
                                        });

                                    },
                                    child: Container(
                                      width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width*0.7,
                                      padding: const EdgeInsets.all(25),

                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Submit",
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
                              const SizedBox(height: 50),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}