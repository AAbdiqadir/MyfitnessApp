import 'package:flutter/material.dart';
import 'package:myfitnessapp/model/products.dart';



class dailytrack {

  String meal;

  String noofServings;
  String dateTime;
  String id;

  String Productid;



  dailytrack({

    required this.meal,

    required this.noofServings,
    required this.dateTime,
    required this.id,
    required this.Productid,
  });

  Map<String,dynamic>toJon()=>{

    "noofServings":noofServings,
    "meal":    meal,
    "Productid":Productid,

    "id":id,
    "dateTime": dateTime

  };


  dailytrack.fromSnapshot(snapshot)
      :
        noofServings = snapshot.data()["noofServings"],
        meal = snapshot.data()["meal"],
        Productid = snapshot.data()["Productid"],
        id = snapshot.data()["id"],
        dateTime = snapshot.data()["dateTime"];


// dailytrack.fromSnapshot(snapshot)
  //     : full_name = snapshot.data()["full_name"],
  //       company = snapshot.data()["company"],
  //       age = snapshot.data()["age"];
  //       dateTime =


}
