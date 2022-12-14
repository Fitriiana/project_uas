import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddNewMeme extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNewMemeState();
  }
}

class _AddNewMemeState extends State<AddNewMeme> {
  TextEditingController _url = TextEditingController();
  TextEditingController _teksAtas = TextEditingController();
  TextEditingController _teksBawah = TextEditingController();

  File? _image;
  File? _imageProses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Meme'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Text('Preview'),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.network("https://ubaya.fun/blank.jpg")
              ),
            ],
          ),
        ),
      ),
    );
  }

}