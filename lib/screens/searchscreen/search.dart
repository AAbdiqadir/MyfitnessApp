
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class filter2 extends StatefulWidget {
  const filter2({Key? key}) : super(key: key);

  @override
  State<filter2> createState() => _filter2State();
}

class _filter2State extends State<filter2> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return   Container(




          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,


                children: [

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

    );









  }
}

