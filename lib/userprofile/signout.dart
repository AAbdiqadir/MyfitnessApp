import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/userprofile/pages/profile_page.dart';

import '../screens/intropage/intropage.dart';

class signout extends StatefulWidget {


  const signout({Key? key}) : super(key: key);

  @override
  State<signout> createState() => signoutState();
}

class signoutState extends State<signout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ProfilePage();
          }
          else{
            return intropage();
          }

        },
      ),
    );
  }
}
