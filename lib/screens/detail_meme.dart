import 'package:flutter/material.dart';
import 'package:project_uas/class/meme.dart';

class DetailMeme extends StatefulWidget {
  int memeID;

  DetailMeme({
    super.key,
    required this.memeID,
  });

  @override
  State<DetailMeme> createState() => _DetailMemeState();
}

class _DetailMemeState extends State<DetailMeme> {
  Meme? mm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
