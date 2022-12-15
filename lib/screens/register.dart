// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _user_cont = TextEditingController();
  String _username = "";
  String _password = "";
  String _rPassword = "";
  String _firstName = "";
  String _lastName = "";

  void doRegist() async {
    final response = await http.post(
        Uri.parse("https://ubaya.fun/flutter/160419063/meme/register.php"),
        body: {
          'username': _username,
          'password': _password,
          'rPassword': _rPassword,
          'nama_depan': _firstName,
          'nama_belakang': _lastName
        });
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      if (json['result'] == 'success') {
        MyLogin();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed To Create New Account')));
      }
    } else {
      throw Exception('Failed to read API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Text('Daily Meme Digest', style: TextStyle(fontSize: 30)),
          Text('Create Account',
              style: TextStyle(
                fontSize: 25,
              )),
          Container(
              height: 500,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _user_cont,
                    onChanged: (v) {
                      _username = v;
                      print(_username);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter Username'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (v) {
                      _firstName = v;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                        hintText: 'Enter First Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (v) {
                      _lastName = v;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                        hintText: 'Enter Last Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    onChanged: (v) {
                      _password = v;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    onChanged: (v) {
                      _rPassword = v;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repeat Password',
                        hintText: 'Enter Repeat Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        doRegist();
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ])),
        ])));
  }
}
