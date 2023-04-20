import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/pages/Homepage.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:myfitnessapp/pages/desktop.dart';
import 'package:myfitnessapp/pages/Workouts.dart';
import 'package:myfitnessapp/pages/searchforfoodpage.dart';
import 'package:myfitnessapp/profile&managementscreen/foodformpage.dart';
import 'package:myfitnessapp/profile&managementscreen/profile.dart';
import 'package:myfitnessapp/responsive_design.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfitnessapp/screens/caloriespage/constants.dart';
import 'package:myfitnessapp/screens/caloriespage/mealplan.dart';
import 'package:myfitnessapp/screens/dashboard/workouts.dart';
import 'package:myfitnessapp/screens/foods/fooddescriptionpage.dart';
import 'package:myfitnessapp/screens/foods/fooddescriptionpage2.dart';
import 'package:myfitnessapp/screens/intropage/Login.dart';
import 'package:myfitnessapp/screens/intropage/Registerpage.dart';
import 'package:myfitnessapp/screens/intropage/intropage.dart';
import 'package:myfitnessapp/screens/intropage/mainpage.dart';
import 'package:myfitnessapp/screens/profilescreen/profile.dart';
import 'package:myfitnessapp/screens/searchscreen/details.dart';
import 'package:myfitnessapp/screens/workoutdetailscreen/video.dart';
import 'package:myfitnessapp/sidemenucontroller.dart';
import 'package:myfitnessapp/testr.dart';
import 'package:myfitnessapp/userprofile/pages/profile_page.dart';
import 'package:provider/provider.dart';

import 'datatesting.dart';
import 'model/data.dart';
import 'screens/caloriespage/caloriespage.dart';



void main()  async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

   runApp(  MyApp());


}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return  MultiProvider(
    providers: [
    ChangeNotifierProvider(
    create: (context) => CartModel()
    ),
    ChangeNotifierProvider(
    create: (context) => MenuAppController()
    ),
    ],
    child: GetMaterialApp(
    debugShowCheckedModeBanner: false,


    title: 'Flutter Admin Panel',
    theme: ThemeData.light().copyWith(
    scaffoldBackgroundColor:  Colors.grey[300],
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white),
    canvasColor: Colors.grey[200],
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.grey,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0))))),
        inputDecorationTheme: InputDecorationTheme(
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(0.0))),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            primary: Colors.black,
          ),
        )
    ),

    home: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Homepage();
        }
        else{
          return intropage();
        }

      },
    ),
    )

    );
  }
}
