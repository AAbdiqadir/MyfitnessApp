import 'package:flutter/material.dart';
import 'package:myfitnessapp/model/products.dart';



class dailytrack {
  String  name;
  String image;
  int  calories;
  int  fatcont;
  int carbcont;
  int proteincont;
  String meal;
  String ServingSize;
  String noofServings;
  String dateTime;
  String id;



  dailytrack({
    required this.name,
    required this.image,
    required this.calories,
    required this.fatcont,
    required this.carbcont,
    required this.proteincont,
    required this.meal,
    required this.ServingSize,
    required this.noofServings,
    required this.dateTime,
    required this.id,
  });

  Map<String,dynamic>toJon()=>{
    'name': name,
    'image': image,
    'calories': calories,
    'fatcont': fatcont,
    'carbcont': carbcont,
    'proteincont': proteincont,
    "noofServings":noofServings,
    "meal":    meal,
    "ServingSize":ServingSize,
    "id":id,
    "dateTime": dateTime

  };


  dailytrack.fromSnapshot(snapshot)
      : name = snapshot.data()["name"],
        image = snapshot.data()["image"],
        calories = snapshot.data()["calories"],
        fatcont = snapshot.data()["fatcont"],
        carbcont = snapshot.data()["carbcont"],
        proteincont = snapshot.data()["proteincont"],
        noofServings = snapshot.data()["noofServings"],
        meal = snapshot.data()["meal"],
        ServingSize = snapshot.data()["ServingSize"],
        id = snapshot.data()["id"],
        dateTime = snapshot.data()["dateTime"];


// dailytrack.fromSnapshot(snapshot)
  //     : full_name = snapshot.data()["full_name"],
  //       company = snapshot.data()["company"],
  //       age = snapshot.data()["age"];
  //       dateTime =


}
