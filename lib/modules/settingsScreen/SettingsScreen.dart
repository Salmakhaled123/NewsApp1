import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget
{
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Screen',
        style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 35)),);
  }
}
