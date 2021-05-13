import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:oemtester/custom_widgets/primary_button.dart';
import 'package:oemtester/screens/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  IconData _suffixIcon = Icons.lock_outline;

  final emailValidator = MultiValidator([
    EmailValidator(errorText: 'Invalid Email_Id'),
    RequiredValidator(errorText: 'Required*')
  ]);

  final passwordValidator = MultiValidator([
    MinLengthValidator(8, errorText: 'Password must be 8 characters*'),
  ]);

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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
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
