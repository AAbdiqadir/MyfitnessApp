import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfitnessapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(

          child: Container(

            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(


                    children: [
                      DrawerHeader(
                          child: Image.asset("images/water.png"
                            ,

                          )

                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Transform.scale(
                        scale: 0.8,
                       child : CheckboxListTile(
                          title: Text("Dashboard",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          value: _isChecked,
                         checkColor: Colors.white,
                         activeColor: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(
                             Radius.circular(5.0),
                           ),
                         ),
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },

                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child : CheckboxListTile(
                          title: Text("Dashboard",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          value: _isChecked,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },

                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child : CheckboxListTile(
                          title: Text("Dashboard",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          value: _isChecked,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },

                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child : CheckboxListTile(
                          title: Text("Dashboard",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          value: _isChecked,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },

                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ),









                    ]
                ),
            ),
          ),

    );







  }
}
