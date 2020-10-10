import 'package:flutter/material.dart';

class AboutDeveloperScreen extends StatelessWidget {
  static const routeName = '/about_dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About developer')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
          elevation: 3,
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Text(
              'Hi there!\nI my name is Rajarshi Barman and I am the developer of this app. I am a 15 year old software developer from Kolkata, India. I very passionate about techonolgy and software nam I\'m glad that I got the privilage to get started in this field at an early age. Other than tech I also love music (mostly alternative & hard rock and 80s synthwave), soprts like football and cricket, playing video games and sleeping ;p',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
