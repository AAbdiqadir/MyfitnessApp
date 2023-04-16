import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive_design.dart';

class textfields extends StatelessWidget {
   textfields({Key? key,

  required this.field, required this.vontroller,

     required this.obsecure,
     this.onvalidate
  }) : super(key: key);


  final String field;
  final TextEditingController vontroller;
  final bool obsecure;
  String? Function(String?)? onvalidate;



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field,
              style: openSans.copyWith(
                fontSize: 15.0,
                color: AppColorss.blueDarkColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6.0),
            Container(

              width: Responsive.isDesktop(context)? width*0.4:Responsive.isTablet(context)? width*0.4 :width < 552? width*0.85 :width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),

              ),

              child: TextFormField(
                controller: vontroller,

                style: openSans.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColorss.blueDarkColor,
                  //fontSize: 12.0,
                ),
                key: const Key('counter'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:onvalidate ,
                obscureText:obsecure,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,

                    hintText: field,
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
