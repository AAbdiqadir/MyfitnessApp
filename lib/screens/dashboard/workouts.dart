//
// import 'package:flutter/material.dart';
// import 'package:myfitnessapp/tiles/productfittile.dart';
//
// import '../../constants.dart';
// class workouts extends StatelessWidget {
//   const workouts({Key? key,
//     this.crossAxisCount = 4, this.childAspectRatio= 0.76}) : super(key: key);
//
//   final int crossAxisCount;
//   final double childAspectRatio;
//   final List _shopItems = const [
//     // [ itemName, itemPrice, imagePath, color ]
//     ["Avocado", "4.00", "images/avocado.png", Colors.green,"exercises/shoulder.jpg"],
//     ["Banana", "2.50", "images/banana.png", Colors.yellow,"exercises/cardio.jpg"],
//     ["Chicken", "12.80", "images/chicken-leg.png", Colors.brown,"exercises/biceps.jpg"],
//     ["Water", "1.00", "images/water.png", Colors.blue,"exercises/boxing.jpg"],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all( 14.0),
//       child: Container(
//
//
//             child: GridView.builder(
//                 shrinkWrap: true,
//                 itemCount: _shopItems.length,
//                 gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
//                   (crossAxisCount: crossAxisCount,
//                 childAspectRatio: childAspectRatio,
//
//                 ), itemBuilder:
//                 (context,index)
//             {
//               return GroceryItemTile(
//
//                 background: _shopItems[index][4],
//                   itemName: _shopItems[index][0],
//                   itemPrice:_shopItems[index][1],
//                   imagePath:_shopItems[index][2],
//                   color:_shopItems[index][3],
//
//               );
//
//             }
//
//             ),
//
//       ),
//     );
//   }
// }
