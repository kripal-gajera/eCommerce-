import 'package:flutter/material.dart';

import '../home_page/home.dart';
import 'Sign_in.dart';
import 'helper_function.dart';

class userfind extends StatefulWidget {
  const userfind({Key? key}) : super(key: key);

  @override
  State<userfind> createState() => _userfindState();
}

class _userfindState extends State<userfind> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSignedIn ? Home() : sign_in();
  }
}
