import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class navrail extends StatefulWidget {
  const navrail({Key? key}) : super(key: key);

  @override
  State<navrail> createState() => _navrailState();
}

class _navrailState extends State<navrail> {
  int selectedindex =0;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(destinations:[
    NavigationRailDestination(icon: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
        , height: 16,
        colorFilter: ColorFilter.mode(
          Colors.black54,
          BlendMode.srcIn,
        )
    ),
        label: Text("")),
      NavigationRailDestination(icon: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
          , height: 16,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.srcIn,
          )
      ),
          label: Text("")),
      NavigationRailDestination(icon: SvgPicture.asset("images/dashboard-2-svgrepo-com.svg"
          , height: 16,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.srcIn,
          )
      ),
          label: Text("")),
        ]
      ,
      selectedIndex: selectedindex,
    );
  }
}
