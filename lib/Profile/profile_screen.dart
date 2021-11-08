import 'package:flutter/material.dart';
import 'package:oxydu/Profile/Profile.dart'; 
/*class ProfileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
         //  const PrimaryColor = const Color(0xFFFFB74D);
    return Scaffold(
     resizeToAvoidBottomInset: false, 
      body:Bodyy(),
    );
  }
}*/

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>  {
  @override 

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) { 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Bodyy(),
    );
  }
}
