// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _user_cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Column(children: [
          Text('Daily Meme Digest', style: TextStyle(fontSize: 30)),
          Text('Create Account',
              style: TextStyle(
                fontSize: 25,
              )),
          Container(
              child: Column(children: [
            TextField(
              controller: _user_cont,
              onChanged: (v) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Username'),
            ),
            TextField(
              controller: _user_cont,
              onChanged: (v) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  hintText: 'Enter First Name'),
            ),
            TextField(
              controller: _user_cont,
              onChanged: (v) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  hintText: 'Enter Last Name'),
            ),
            TextField(
              controller: _user_cont,
              onChanged: (v) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password'),
            ),
            TextField(
              controller: _user_cont,
              onChanged: (v) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Repeat Password',
                  hintText: 'Enter Repeat Password'),
            ),
          ])),
        ]));
  }
}
