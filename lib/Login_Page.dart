import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart'; 
import 'nav_barTest.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  String userName, password;
  gotohomeScreen() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    Response responseval = await dio.post(
      'https://oxydu.com/wp-json/custom-plugin/login',
      data: {"username": "$userName", "password": "$password"},
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );
    if (responseval.statusCode == 200) {
        id = responseval.data['ID']; 
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', id.toString());
      Navigator.of(context).pop();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => MyyyApp()));
      /* Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) {
                   return Placeyouradd();
                 },
               ),
             ); */
    }
    if (responseval.statusCode == 500) {
      final snackBar = SnackBar(
          content:
              Text(translator.translate('User name / password is invalid')));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          translator.translate('User name'),
          style: kLabelStyle,
        ),
        SizedBox(height: 1.5.w),
        Container(
          alignment: Alignment.centerLeft,
          decoration: //kBoxDecorationStyle,
              new BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          height: 50.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: translator.translate('Enter your user name'),
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
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
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          translator.translate('Password'),
          style: kLabelStyle,
        ),
        SizedBox(height: 1.5.w),
        Container(
          alignment: Alignment.centerLeft,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          height: 50.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              // color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: translator.translate('Enter your Password'),
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
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
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => gotohomeScreen(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          translator.translate('LOGIN'),
          style: TextStyle(
            //color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildlogo(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9E9E9E),
              Color(0xFF9E9E9E),
              Color(0xFF9E9E9E),
              Color(0xFF9E9E9E),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'asset/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'asset/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildlogo(
            () => print('Login with Facebook'),
            AssetImage(
              'asset/oxydu.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF9E9E9E),
                      Color(0xFF9E9E9E),
                      Color(0xFF9E9E9E),
                      Color(0xFF9E9E9E),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildLogoRow(),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        // _buildForgotPasswordBtn(),
                        //_buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        // _buildSignInWithText(),
                        // _buildSocialBtnRow(),
                        // _buildSignupBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
