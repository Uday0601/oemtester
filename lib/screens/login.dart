import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:oemtester/custom_widgets/primary_button.dart';
import 'package:oemtester/screens/home.dart';
import 'package:oemtester/services/authServices.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  IconData _suffixIcon = Icons.lock_outline;

  final emailValidator = MultiValidator([
    EmailValidator(errorText: 'Invalid Email_Id'),
    RequiredValidator(errorText: 'Required*')
  ]);

  final passwordValidator = MultiValidator([
    MinLengthValidator(8, errorText: 'Password must be 8 characters*'),
  ]);

  //Method to check AuthState
  checkAuthState() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
      },
    );
  }

  //initState
  @override
  void initState() {
    super.initState();
    this.checkAuthState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logo',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.deepPurpleAccent,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: emailValidator,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key_rounded),
                      suffixIcon: IconButton(
                          icon: Icon(_suffixIcon),
                          onPressed: () {
                            setState(() {
                              if (_obscureText == true) {
                                _obscureText = false;
                                _suffixIcon = Icons.lock_open_outlined;
                              } else {
                                _obscureText = true;
                                _suffixIcon = Icons.lock_outline;
                              }
                            });
                          }),
                    ),
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: passwordValidator,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0.0),
                  child: PrimaryButton(
                    onPressed: () async {
                      Future<bool> shouldNavigate =
                          AuthServices(FirebaseAuth.instance).login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      // ignore: unrelated_type_equality_checks
                      if (shouldNavigate == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }
                    },
                    text: 'Login',
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
