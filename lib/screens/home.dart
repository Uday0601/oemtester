import 'package:flutter/material.dart';
import 'package:oemtester/custom_widgets/notification_action.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('OEM Tester'),
        centerTitle: false,
        actions: [
          NotificationAction(),
        ],
      ),
      body: Container(),
    );
  }
}
