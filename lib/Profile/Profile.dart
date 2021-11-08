// class FormScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return FormScreenState();
//   }
// }

// class FormScreenState extends State<FormScreen>
//     with AutomaticKeepAliveClientMixin {
// String _name;
// String _email = '';
// String _password;
// String _url;
// String _phoneNumber;
// String _calories;

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// Widget _buildName() {
//   return TextField(
//     decoration: InputDecoration(labelText: 'Name'),
//    // maxLength: 10,
//   );
// }

// Widget _buildEmail() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Email'),
//     validator: (String value) {
//       if (value.isEmpty) {
//         return 'Email is Required';
//       }

//       if (!RegExp(
//               r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//           .hasMatch(value)) {
//         return 'Please enter a valid email Address';
//       }

//       return null;
//     },
//     onSaved: (String value) {
//       _email = value;
//     },
//   );
// }

// Widget _buildPassword() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Password'),
//     validator: (String value) {
//       if (value.isEmpty) {
//         return 'Password is Required';
//       }

//       return null;
//     },
//     onSaved: (String value) {
//       _password = value;
//     },
//   );
// }

// Widget _builGender() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Gender'),
//     keyboardType: TextInputType.url,
//     validator: (String value) {
//       if (value.isEmpty) {
//         return 'Gender is Required';
//       }

//       return null;
//     },
//     onSaved: (String value) {
//       _url = value;
//     },
//   );
// }

// Widget _buildPhoneNumber() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Phone number'),
//     keyboardType: TextInputType.phone,
//     validator: (String value) {
//       if (value.isEmpty) {
//         return 'Phone number is Required';
//       }

//       return null;
//     },
//     onSaved: (String value) {
//       _url = value;
//     },
//   );
// }

// Widget _buildCalories() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Birth'),
//     keyboardType: TextInputType.number,
//     validator: (String value) {
//       int calories = int.tryParse(value);

//       if (calories == null || calories <= 0) {
//         return 'Birth must be greater than 0';
//       }

//       return null;
//     },
//     onSaved: (String value) {
//       _calories = value;
//     },
//   );
// }

//   @override
//   bool get wantKeepAlive => true;
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(24),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ProfilePic(),
//                 _buildName(),
//                 _buildPassword(),
//                 _buildPhoneNumber(),
//                 _buildEmail(),
//                 _builGender(),
//                 _buildCalories(),
//                 SizedBox(height: 100),
//                 // ignore: deprecated_member_use
//                 RaisedButton(
//                   child: Text(
//                     'Submit',
//                     style: TextStyle(color: Colors.blue, fontSize: 16),
//                   ),
//                   onPressed: () async {
//                     SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                     prefs.remove('id');
//                    /* SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                     prefs.remove('id');
//                     final snackBar = SnackBar(
//                         content: Text(
//                             translator.translate("You've been logged out")));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);*/

//                     /* Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (BuildContext ctx) => LoginScreen()));*/
//                     // if (!_formKey.currentState.validate()) {
//                     //   return;
//                     // }

//                     //_formKey.currentState.save();
//                     //Send to API
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/Profile/profileMenu.dart';
import 'package:oxydu/Profile/profilePic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'ProfileDetails.dart';
import 'myfavorites_screen.dart';
import 'package:oxydu/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName, password, text;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
    if (id == null)
      text = "Log in";
    else
      text = "Log out";
  }

  void _openPopup(context) {
    Alert(
        context: context,
        title: translator.translate('LOGIN'),
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: translator.translate('User name'),
                ),
                // ignore: missing_return
                validator: (dynamic value) {
                  if (value.isEmpty) return;
                },
                onSaved: (value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: translator.translate('Password'),
                ),
                // ignore: missing_return
                validator: (dynamic value) {
                  if (value.isEmpty) return;
                },
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () async {
              if (!_formKey.currentState.validate()) return;
              _formKey.currentState.save();
              Dio dio = new Dio();
              dio.options.headers["Authorization"] = "Bearer $s";
              Response responseval = await dio.post(
                'https://oxydu.com/wp-json/custom-plugin/login',
                data: {"username": "$userName", "password": "$password"},
                options: Options(
                    followRedirects: false, validateStatus: (status) => true),
              );
              if (responseval.statusCode == 200) {
                id = responseval.data["ID"];
                // List<dynamic> d = responseval.data["roles"];
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('id', id.toString());
                setState(() {
                  text = "Log out";
                });

                Navigator.of(context, rootNavigator: true).pop();
              }
              if (responseval.statusCode == 500) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('User name / password is invalid')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Text(
              translator.translate('LOGIN'),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 10.w),
              ProfilePic(),
              SizedBox(height: 10.w),
              ProfileMenu(
                text: translator.translate("My Account"),
                icon: "asset/icons/User Icon.svg",
                press: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final snackBar = SnackBar(
                      content:
                          Text(translator.translate("Please login / Sign up")));
                  id = prefs.getString('id');
                  id != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Bodyy();
                            },
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              // ProfileMenu(
              //   text: "Notifications",
              //   icon: "assets/icons/Bell.svg",
              //   press: () {},
              // ),
              //  ProfileMenu(
              //   text: "Settings",
              // icon: "asset/icons/Settings.svg",
              //   press: () {},
              //   ),
              // ProfileMenu(
              //   text: "Help Center",
              //   icon: "assets/icons/Question mark.svg",
              //   press: () {},
              // ),
              ProfileMenu(
                text: translator.translate(text),
                icon: "asset/icons/Log out.svg",
                press: () async {
                  if (id != null) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('id');
                    id = null;
                    final snackBar = SnackBar(
                        content: Text(
                            translator.translate("You've been logged out")));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      text = "Log in";
                    });
                  } else
                    setState(() {
                      _openPopup(context);
                    });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Bodyy extends StatefulWidget {
  @override
  _BodyyState createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            bottom: PreferredSize(
              preferredSize: new Size(0, 0),
              child: Container(
                child: TabBar(isScrollable: true, tabs: [
                  Tab(
                    text: translator.translate("My Profile"),
                  ),
                  Tab(
                    text: translator.translate("My Ads"),
                  ),
                  Tab(
                    text: translator.translate("My Favorites"),
                  ),
                  Tab(
                    text: translator.translate("Search History"),
                  ),
                ]),
              ),
            ),
          ),
          body: TabBarView(children: [
            ProfileDetails(),
            MyFavorites(),
            //MyFavorites(),
            Icon(Icons.apps),
            Icon(Icons.apps),
            //Icon(Icons.apps),
          ]),
        ));
  }
}
// --------------------------------------------------------------------------------
