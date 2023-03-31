import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/responsive_design.dart';
import 'package:myfitnessapp/screens/foods/searchbar.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../constants/headers.dart';
import '../../model/dailytrack.dart';
import '../../model/data.dart';
import '../../model/products.dart';
import '../dashboard/foodfeature.dart';
import 'addtorecipes.dart';
import 'fooddescriptionpage.dart';
import 'fooddescriptionpage2.dart';
import 'foodtile.dart';
class dashboardss extends StatefulWidget {
  const dashboardss({Key? key}) : super(key: key);

  @override
  State<dashboardss> createState() => _dashboardssState();
}

class _dashboardssState extends State<dashboardss> {

  late String ss ;

   Product? _productss;
  void setSearchString(String value) => setState(() {
    ss = value;
    print(searchResultTiles.length);
  });


  List <String> foods= ["Recipe", "Food"];

  int Index = 0;
  String? SelectedOption = "Food";
   late List <Product> ahmed;
  List<Widget> searchResultTiles = [];





  @override
  void initState() {
    // TODO: implement initState

    ss = "";

    //fetchProducts();
    super.initState();
  }
  bool _isChecked = true;
  late List <Product> addrecipes = [];
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;



    return Scaffold(


      floatingActionButton: addrecipes.isNotEmpty ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
           Text('Add recipes',
              style: GoogleFonts.openSans(
              color: Color(0xFF022323),
              fontSize: 13,
                  fontWeight:  FontWeight.w400)),
          const SizedBox(width: 16),
          // An example of the small floating action button.
          //
          // https://m3.material.io/components/floating-action-button/specs#669a1be8-7271-48cb-a74d-dd502d73bda4
          FloatingActionButton.small(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => addtorecipes(
                addrecipes: addrecipes,
              )));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ) :null ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
            SizedBox(

                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.10,
                child: headers()),
       // Consumer<CartModel>(

      //   builder: (context, value, child) {
      // Provider.of<CartModel>(context, listen: false).fetchProducts();
      Consumer<CartModel>(
          builder: (context, value, child) {
           // Provider.of<CartModel>(context, listen: false).fetchProducts();
            ahmed = value.products.where((element) => element.type == SelectedOption).toList();

            _productss ??= ahmed[0];




          // setState(() {
          //   _productss = value.products.where((element) => element.type == SelectedOption).toList()[0];
          // });


            if (ss.isNotEmpty) {
             searchResultTiles = value.products
                 .where(
                     (p) => p.name.toLowerCase().contains(ss.toLowerCase()))
                 .map(
                   (p) => Foodtile( title: p.name,
                     image:  p.image,
                     price: 20,
                     calories: "420Kcal",
                     description:
                     "Contrary to popular belief, Lorem Ipsum is not simply "
                         "random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                     color:  Colors.grey,
                     press:(){
                       if(Responsive.isMobile(context))
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Fooddetailpage2(
                           product: p,
                         )));

                     }

                   ),
                   )
                 .toList();
                 }
              if (ss.isEmpty) {
                searchResultTiles.clear();
              }
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex:Responsive.isTablet(context)? 4:3
                        ,
                        child:Column(


                          children: [
                        SizedBox(height: Responsive.isMobile(context)? _size.height * 0.05:

                        _size.height * 0.05,)
                            ,

                            Padding(
                              padding: const  EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                children: [

                                  search(
                                onChanged:setSearchString
                                )


                                ],
                              ),
                            ),
                            SizedBox(height: Responsive.isMobile(context)? _size.height * 0.05:

                            _size.height * 0.05,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(

                                children: [
                                  SizedBox(
                                    width:200,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.grey,
                                                width: 1),
                                          borderRadius: BorderRadius.circular(12)
                                        ),

                                      ),
                                      value : SelectedOption,
                                        items: foods.map((e) =>  DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: openSans.copyWith(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppColorss.textColor,
                                        ),

                                      )
                                    )
                                    ).toList(),
                                        onChanged: (e){
                                        setState(() {
                                          SelectedOption= e;
                                        //  ahmed = value.products.where((element) => element.type == SelectedOption).toList();
                                        });
                                        }),
                                  )
                                  // Text("Chest Workouts",
                                  //   style: GoogleFonts.poppins(
                                  //       color: primaryColor,
                                  //       fontSize: 20, fontWeight: FontWeight.normal),
                                  // ),


                                ],
                              ),
                            ),
                            SizedBox(height: Responsive.isMobile(context)? _size.height * 0.05:

                            _size.height * 0.05,),

                                  Container(
                                        width: _size.width > 754? _size.width *0.8: null,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: searchResultTiles.isEmpty?
                                          GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: ahmed.length,
                                              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
                                                (crossAxisCount: 2,//Responsive.isTablet(context) ? 2 :_size.width < 599? 2:3,
                                                childAspectRatio: Responsive.isTablet(context)? 2 :
                                                Responsive.isMobile(context)?2 :
                                                2,

                                              ), itemBuilder:
                                              (context,index)
                                          {

                                            return  Foodtile(

                                              press: () {



                                                if(Responsive.isMobile(context))
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Fooddetailpage2(
                                                  product: ahmed[index],
                                                )));

                                                 // dailytrack daily = dailytrack(name: _products[0].name,
                                                 //     image: _products[0].image, calories: _products[0].calories,
                                                 //     fatcont: _products[0].fatcont, carbcont: _products[0].carbcont,
                                                 //     proteincont: _products[0].proteincont, meal: "breakfast",
                                                 //     ServingSize: _products[0].ServingSize, noofServings: _products[0].noofServings,
                                                 //     dateTime: "dateTime", id: "id");

                                                //Provider.of<CartModel>(context, listen: false).addUser(daily);
                                                setState(() {
                                                  Index = index;
                                                  _productss = ahmed[index];
                                               //   product = value.products[index];
                                                });




                                              },
                                              title: ahmed[index].name,
                                              image: ahmed[index].image,
                                              price: 20,
                                              calories: "420Kcal",
                                              description:
                                              "Contrary to popular belief, Lorem Ipsum is not simply "
                                                  "random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                                              color: index ==Index? Colors.brown: Colors.grey,
                                              value: addrecipes.contains(ahmed[index]),
                                              onchanged: (bool? newvalue){
                                                setState(() {

                                                  if(newvalue!){
                                                    addrecipes.add(ahmed[index]);
                                                  }
                                                  else{
                                                    addrecipes.remove(ahmed[index]);
                                                  }


                                                });
                                              },
                                            );

                                          }

                                          ):GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: searchResultTiles.length,
                                              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
                                                (crossAxisCount: searchResultTiles.length==1? 1:2,//Responsive.isTablet(context) ? 2 :_size.width < 599? 2:3,
                                                childAspectRatio: Responsive.isTablet(context)? 2 :
                                                Responsive.isMobile(context)?2 :
                                                searchResultTiles.length==1? 4:2,

                                              ), itemBuilder:
                                              (context,index)
                                          {
                                            return  searchResultTiles[index];

                                          }

                                          )


                                        ),
                                      ),


                            // Container(
                            //   width: _size.width > 754? _size.width *0.8: null,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: GridView.builder(
                            //         shrinkWrap: true,
                            //         itemCount: 10,
                            //         gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount
                            //           (crossAxisCount: 2,//Responsive.isTablet(context) ? 2 :_size.width < 599? 2:3,
                            //           childAspectRatio: Responsive.isTablet(context)? 2 :
                            //           Responsive.isMobile(context)?2 :
                            //           2,
                            //
                            //         ), itemBuilder:
                            //         (context,index)
                            //     {
                            //       return  Foodtile(
                            //         press: () {
                            //           setState(() {
                            //             Index = index;
                            //             product = Product(name: "avocado",
                            //                 image: "images/avocado.png",
                            //                 calories: 20,
                            //                 fatcont: 30,
                            //                 carbcont: 50,
                            //                 proteincont: 70, type: '', ServingSize: '', noofServings: '');
                            //           });
                            //
                            //
                            //           if(Responsive.isMobile(context))
                            //             print("object");
                            //
                            //
                            //         },
                            //         title: "Vegan salad bowl",
                            //         image: "images/banana.png",
                            //         price: 20,
                            //         calories: "420Kcal",
                            //         description:
                            //         "Contrary to popular belief, Lorem Ipsum is not simply random text. It "
                            //             "has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                            //         color: index ==Index? Colors.brown: Colors.grey,
                            //       );
                            //
                            //     }
                            //
                            //     ),
                            //   ),
                            // ),






                          ],
                        )

                    ),

                    if(!Responsive.isMobile(context))
                    Expanded(

                        flex: 4,
                        child: Container(

                            // color: Colors.black,
                            child: _productss != null? fooddetails(

                              Productdetail: _productss!,): Container(

                              child: Center(
                                child: Text("No data")
                              ),
                            )


                          )

                    )
                  ]

              );
  }
            )

          ],
        ),
      ),
    );
  }
}