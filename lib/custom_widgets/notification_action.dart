import 'package:flutter/material.dart';
import 'package:oemtester/screens/notification.dart';

class NotificationAction extends StatelessWidget {
  const NotificationAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: IconButton(
        icon: Icon(
          Icons.notifications_none_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Notifications(),
            ),
          );
        },
      ),
    );
  }
}
