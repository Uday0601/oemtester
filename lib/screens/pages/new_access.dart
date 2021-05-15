import 'package:flutter/material.dart';

class NewAccess extends StatefulWidget {
  const NewAccess({Key key}) : super(key: key);

  @override
  _NewAccessState createState() => _NewAccessState();
}

class _NewAccessState extends State<NewAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'NewAccess',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
