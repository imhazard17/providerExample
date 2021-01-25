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
              'Hi there!\nMy name is Rajarshi Barman and I am the developer of this app. I am a 15 year old software developer from Kolkata, India. I mostly work with technologies like Nodejs, Flutter, Graphql, Postgres, Mongodb, Docker, Kubernetes, AWS, etc.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
