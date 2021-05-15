import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oemtester/custom_widgets/notification_action.dart';
import 'package:oemtester/screens/pages/Dashboard.dart';
import 'package:oemtester/screens/pages/new_access.dart';
import 'package:oemtester/screens/pages/profile.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    NewAccess(),
    Profile(),
  ];

  final PageStorageBucket _bucket = PageStorageBucket();

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
      body: PageStorage(
        bucket: _bucket,
        child: screens[currentTab],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  minWidth: 40.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        color:
                            currentTab == 0 ? Colors.deepPurple : Colors.grey,
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color:
                              currentTab == 0 ? Colors.deepPurple : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  minWidth: 40.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_add_alt,
                        color:
                            currentTab == 1 ? Colors.deepPurple : Colors.grey,
                      ),
                      Text(
                        'New Access',
                        style: TextStyle(
                          color:
                              currentTab == 1 ? Colors.deepPurple : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                    });
                  },
                  minWidth: 40.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color:
                            currentTab == 2 ? Colors.deepPurple : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color:
                              currentTab == 2 ? Colors.deepPurple : Colors.grey,
                        ),
                      ),
                    ],
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
