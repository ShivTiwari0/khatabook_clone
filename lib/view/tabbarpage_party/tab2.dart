import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text('Party'),
            subtitle: Text(
              '30 sec ago',
              style: TextStyle(color: textColorlightgery),
            ),
            trailing: Text(
              '10',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: textColorred),
            ),
          );
        });
  }
}
