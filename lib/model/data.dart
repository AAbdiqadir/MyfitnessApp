
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfitnessapp/model/dailymeal.dart';
import 'package:myfitnessapp/model/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/screens/intropage/intropage.dart';

import 'dailytrack.dart';
import 'exercises.dart';
import 'ingredients.dart';



class CartModel extends ChangeNotifier {
  // list of items on sale
  final List foods = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "images/avocado.png", Colors.green],
    ["Banana", "2.50", "images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "images/chicken-leg.png", Colors.brown],
    ["Water", "1.00", "images/water.png", Colors.blue],
  ];

  // list of cart items
  var _mealss = [];

  get cartItems => _mealss;

  get shopItems => foods;

  // add item to cart
  void addItemToCart(int index) {


   // products.where((element) => element.full_name == Ahmed).toList();
    _mealss.add(shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _mealss.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }


  List<Product> _products = [];
  List<dailytrack> daily= [];

  List<Product> get products => _products;
  List<dailytrack> get dailys => daily;
  // DateTime now = DateTime.now();

  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  // void onclick(String id){
  //
  //
  //
  //
  //  dailytrack dailytracks = dailytrack(product: product, dateTime: DateTime.now().toString());
  //  dailys.add( dailytracks );
  //  //
  //   addUser(dailytracks);
  //
  // }


  Future<void> addmeal(dailytrack daily, String docid) {
    // Call the user's CollectionReference to add a new user
    //User? user = FirebaseAuth.instance.currentUser;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final  user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;

    CollectionReference users = FirebaseFirestore.instance.collection('cart');
    final json = daily.toJon();
    return users.doc(uid).collection("meals").doc(docid).set(json)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addworkout(exercises workouts) {
    // Call the user's CollectionReference to add a new user
    //User? user = FirebaseAuth.instance.currentUser;


    CollectionReference users = FirebaseFirestore.instance.collection('workouts');
    final json = workouts.toJon();
    return users.doc().set(json)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> recipeingridents(Ingredient ingredient, String DocID)  {
    CollectionReference docs = FirebaseFirestore.instance.collection('recipeingredients');

    final document = docs.doc(DocID);
    //Ingredient ingredient = Ingredient(products: products);
    final json = ingredient.toJon();
    return document.set(
      json)
        .then((value) => print("food Added"),
    )
        .catchError((error) => print("Failed to add user: $error"));
  }


  Future<void> addfood(Product products, String DocID) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final  user = FirebaseAuth.instance.currentUser;
    final uid = user?.email;
    CollectionReference docs = FirebaseFirestore.instance.collection('fooddetails');

    final document = docs.doc(DocID);



    // Call the user's CollectionReference to add a new user
    final json = products.toJon();
    return document.set(json)
        .then((value) => print("food Added"),
    )
        .catchError((error) => print("Failed to add user: $error"));
  }
  List<dailytrack> _meals = [];

  List<dailymeal> allmeals = [];
  List<dailymeal> get allmeals_ => allmeals;
  void  getallmeal()  {

    for (int i = 0; i<_meals.length; i++){

      Product products_ = _products.firstWhere((element) => element.FoodID == _meals[i].Productid);

      dailymeal dailys = dailymeal(product: products_, mealfor_day: _meals[i]);

      allmeals.add(dailys);
    }

  }
  List<Ingredient>  myingredient =[];
  List<Ingredient> get prodingredient => myingredient;
  Future<void> ingredientid( ) async {
    final snapshot = await FirebaseFirestore.instance.collection('recipeingredients').get();
    //final document = users.doc(DocID);
    final list = snapshot.docs.map((doc) => Ingredient.fromSnapshot(doc)).toList();
    myingredient = list;

    notifyListeners();
  }
  Future<void> fetchmeals() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final  user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final snapshot = await FirebaseFirestore.instance.collection('cart').doc(uid).collection("meals").get();
    //final document = users.doc(DocID);
    final list = snapshot.docs.map((doc) => dailytrack.fromSnapshot(doc)).toList();
    _meals = list;
    allmeals.clear();

    getallmeal();

    notifyListeners();
  }

  Future<void> fetchworkouts( ) async {
    final snapshot = await FirebaseFirestore.instance.collection('workouts').get();
    //final document = users.doc(DocID);
    final list = snapshot.docs.map((doc) => exercises.fromSnapshot(doc)).toList();
    _workouts = list;

    notifyListeners();
  }
  List <exercises> _workouts = [];
  List <exercises> get workouts=> _workouts;
  Future<void> fetchProducts( ) async {
    final snapshot = await FirebaseFirestore.instance.collection('fooddetails').get();
    //final document = users.doc(DocID);
    final products = snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    _products = products;
    notifyListeners();
  }


  List<dailytrack> get meals => _meals;



  Future<void> deleteField(String DOCID) {

    CollectionReference users = FirebaseFirestore.instance.collection('cart');

    return users.doc().collection("cart").doc(DOCID).delete();
  }




}
