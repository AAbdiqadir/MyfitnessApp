import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../caloriespage/appbar_widget.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
      child:  AppBarWidget()

        ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          width: double.infinity,

          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(

                width: 120,
                height: 120,
                child: ClipRRect
                  (
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("exercises/shoulder.jpg",
                    fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 20,
              )
              ,
              Text("Ahmed Abdiqadir",
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 20, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 5,
              ),
              Text("ahmedowabdiqadir@gmail.com",
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 15, fontWeight: FontWeight.normal),
              )
              ,
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){}, child: Text("Edit Profile",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 10, fontWeight: FontWeight.w300),
              ),
              style:ElevatedButton.styleFrom(
                backgroundColor: calbg,

              )
              )
              



            ],
          ),
        ),
      ),
    );
  }
}
