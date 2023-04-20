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
import '../model/exercises.dart';
import '../model/products.dart';
import '../sidemenucontroller.dart';


class workout extends StatefulWidget {
  const workout({Key? key}) : super(key: key);

  @override
  State<workout> createState() => workoutState();
}

class workoutState extends State<workout> {
  final  name = TextEditingController();
  final image = TextEditingController();
  final  ExerciseAnatomy = TextEditingController();
  final Description = TextEditingController();
  final  video = TextEditingController();

  final Type = TextEditingController();




  Future <void> adddata() async{


    if(name.text.trim().isEmpty||image.text.trim().isEmpty||video.text.trim().isEmpty||
        Type.text.trim().isEmpty|| Description.text.trim().isEmpty||ExerciseAnatomy.text.trim().isEmpty) {

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




    //Provider.of<CartModel>(context, listen: false).addfood(products,DOCID );
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
    ExerciseAnatomy.dispose();
    Description.dispose();
    video.dispose();
    Type.dispose();
    super.dispose();

  }

  bool ahmed = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        key: context.read<MenuAppController>().scaffoldKey,
        appBar: Responsive.isMobile(context)? PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                color:  !Responsive.isMobile(context)? Colors.black: Colors.grey[300],
                child:
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
                                SizedBox(height: Responsive.isMobile(context)? height * 0.1:height * 0.1,

                                  child: Container(

                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Center(

                                      // child:Lottie.network(
                                      //     "https://assets4.lottiefiles.com/packages/lf20_le8PpGpm9v.json",
                                      //     fit: BoxFit.cover
                                      // ),
                                    ),
                                  ),
                                ),



                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text('Enter Workout description',
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

                                textfields(field: "ExerciseAnatomy", vontroller: ExerciseAnatomy,
                                  obsecure: false,
                                  onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                  'Enter password correctly':null,
                                ),
                                SizedBox(height: height * 0.014),

                                textfields(field: "Description", vontroller: Description,
                                  obsecure: false,
                                  onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                  'Enter password correctly':null,
                                ),
                                SizedBox(height: height * 0.014),

                                textfields(field: "video", vontroller: video,
                                  obsecure: false,
                                  onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                  'Enter password correctly':null,
                                ),
                                SizedBox(height: height * 0.014),

                                textfields(field: "Type", vontroller: Type,
                                  obsecure: false,
                                  onvalidate: (value)=> value!= null&&value.length >1&&!value.isNum?
                                  'Enter password correctly':null,
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
      ),
    );
  }
}