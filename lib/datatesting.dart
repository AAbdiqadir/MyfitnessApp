import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/data.dart';
import 'model/products.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'model/data.dart';
// class database extends StatefulWidget {
//   const database({Key? key}) : super(key: key);
//
//   @override
//   State<database> createState() => _databaseState();
// }
//
// class _databaseState extends State<database> {
//   List<Product> products = [];
//
// @override
// void initState() {
//   super.initState();
//   getdataw().then((ahmeds) {
//     setState(() {
//       products = ahmeds;
//     });
//   });
// }
//
//   Future getdataw() async {
//     var doc = await FirebaseFirestore.instance.collection("products").get();
//
//    final ahmeds = doc.docs.map((doc)=>Product.fromSnapshot(doc)).toList();
//
//    return ahmeds;
//
//
//   }
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   void deleteDocumentsWhereAge(int age) async {
//     QuerySnapshot querySnapshot = await firestore
//         .collection('products')
//         .where('age', isEqualTo: age)
//         .get();
//
//     for (DocumentSnapshot docSnapshot in querySnapshot.docs) {
//       await docSnapshot.reference.delete();
//     }
//   }
//
//   Future getdata() async {
//     var doc = await FirebaseFirestore.instance.collection("products").get();
//
//  //   ahmed = List.from(doc.docs.map((doc)=>Product.fromSnapshot(doc)));
//
//   }
//   var Ahmed = "Ahmed";
//   var commonName = "isa";
//   final CollectionReference _reference = FirebaseFirestore.instance.collection("products");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 24.0),
//           child: Icon(
//             Icons.location_on,
//             color: Colors.grey[700],
//           ),
//         ),
//         title: Text(
//           'Sydney, Australia',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey[700],
//           ),
//         ),
//         centerTitle: false,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 24.0),
//             child: Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 Icons.person,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.black,
//         onPressed: (){},
//         child: const Icon(Icons.shopping_bag),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 48),
//
//           // good morning bro
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Text('Good morning,'),
//           ),
//
//           const SizedBox(height: 4),
//
//           // Let's order fresh items for you
//
//
//           const SizedBox(height: 24),
//
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Divider(),
//           ),
//
//           const SizedBox(height: 24),
//
//           // categories -> horizontal listview
//
//
//           // recent orders -> show last 3
//           Expanded(
//             flex: 4,
//             child: Consumer<CartModel>(
//
//               builder: (context, value, child) {
//                 Provider.of<CartModel>(context, listen: false).fetchProducts();
//                 List<Product> ahmed = value.products.where((element) => element.full_name == Ahmed).toList();
//                 return GridView.builder(
//                   padding: const EdgeInsets.all(12),
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: ahmed.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     childAspectRatio: 1
//
//                   ),
//                   itemBuilder: (context, index) {
//
//
//                     return ListTile(
//
//                       leading: Text(ahmed[index].full_name.toString()),
//                       title: Text(ahmed[index].company.toString()),
//                       trailing: InkWell(onTap: (){
//                         setState(() {
//                           Ahmed = "Ahmed";
//                         });
//                         Provider.of<CartModel>(context, listen: false).onclick();
//
//
//                       },
//                         hoverColor: Colors.red,
//                         child: Container(
//                           color: Colors.grey,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("add cart"),
//                           ),
//                         ),
//                       )
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//
//           Expanded(child: Consumer<CartModel>(
//
//             builder: (context, value, child) {
//
//               return GridView.builder(
//                 padding: const EdgeInsets.all(12),
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: value.dailys.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     childAspectRatio: 4
//
//                 ),
//                 itemBuilder: (context, index) {
//
//
//                   return ListTile(
//
//                       // leading: Text(value.dailys[index].full_name.toString()),
//                       // title: Text(value.dailys[index].full_name.toString()),
//                       trailing: InkWell(onTap: (){
//                         setState(() {
//                           Ahmed = "Ahmed";
//                         });
//
//
//                       },
//                         hoverColor: Colors.red,
//                         child: Container(
//                           color: Colors.grey,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("remove"),
//                           ),
//                         ),
//                       )
//                   );
//                 },
//               );
//             },
//           ))
//
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //   children: [
//           //     ElevatedButton(onPressed: (){
//           //
//           //
//           //       setState(() => ahmed = 'Avocado');
//           //     }, child: Text("Avocado")),
//           //     ElevatedButton(onPressed: (){
//           //       setState(() => ahmed = 'Banana');
//           //     }, child: Text("Banana")),
//           //     ElevatedButton(onPressed: (){
//           //       setState(() => ahmed = 'Chicken');
//           //     }, child: Text("Chicken")),
//           //     ElevatedButton(onPressed: (){
//           //       setState(() => ahmed = 'Water');
//           //     }, child: Text("Water"))
//           //
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// // Future getdata() async {
// //   var doc = await FirebaseFirestore.instance.collection("products").get();
// //
// //   meals = List.from(doc.docs.map((doc)=>Meal.fromSnapshot(doc)));
// //
// //
// // }
// }
