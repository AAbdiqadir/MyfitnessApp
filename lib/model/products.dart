import 'package:flutter/material.dart';



class Product {
  String  name;
  String image;
  int  calories;
  int  fatcont;
  int carbcont;
  int proteincont;
  String type;
  String ServingSize;
  String noofServings;




  String  FoodID;

  Product({
    required this.name,
    required this.image,
    required this.calories,
    required this.fatcont,
    required this.carbcont,
    required this.proteincont,
    required this.type,
    required this.ServingSize,
    required this.noofServings,
    required this.FoodID



  });

  Map<String,dynamic>toJon()=>{
    'name': name,
    'image': image,
    'calories': calories,
    'fatcont': fatcont,
    'carbcont': carbcont,
    'proteincont': proteincont,
    "noofServings":noofServings,
    "type":    type,
    "ServingSize":ServingSize,
    "FoodID":FoodID

};
  Product.fromSnapshot(snapshot)
      : name = snapshot.data()["name"],
        image = snapshot.data()["image"],
        calories = snapshot.data()["calories"],
      fatcont = snapshot.data()["fatcont"],
        carbcont = snapshot.data()["carbcont"],
        proteincont = snapshot.data()["proteincont"],
        noofServings = snapshot.data()["noofServings"],
        type = snapshot.data()["type"],
        ServingSize = snapshot.data()["ServingSize"],
        FoodID = snapshot.data()["FoodID"];


}
