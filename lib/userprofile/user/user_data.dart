import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static String image = "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg";
  static Users myUser = Users(

    name: 'Test Test',
    email: 'test.test@gmail.com',
    phone: '(208) 206-5039',
    aboutMeDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...',
  );

  // static Future init() async =>
  //     _preferences = await SharedPreferences.getInstance();

  // static Future setUser(User user) async {
  //   final json = jsonEncode(user.toJson());
  //
  //   await _preferences.setString(_keyUser, json);
  // }

  static late Users _current ;

  static Users get current => _current;

  Future<void> fetchuser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final  user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    //final document = users.doc(DocID);
    final document = Users.fromSnapshot(snapshot);

    _current = document;

  }
  static Users getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : Users.fromJson(jsonDecode(json));
  }
}
