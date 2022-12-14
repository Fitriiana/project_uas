import 'dart:convert';

import 'package:flutter/material.dart';
import '../class/meme.dart';

class Home extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('This is the history screen'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Meme Digest'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [

              ],
              padding: EdgeInsets.only(left: 8,right: 8),
            ),
            Divider(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  Widget widMemes(data) {
    List<Meme> memes = [];
    Map json = jsonDecode(data);
    for (var mem in json['data']) {
      Meme m = Meme.fromJson(mem);
      memes.add(m);
    }
    return ListView.builder(
        itemCount: memes.length,
        itemBuilder: (BuildContext ctxt, int index){
          return Card(
            elevation: 12,
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(memes[index].url),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  ],
                ),
              ],
            ),
          );
        }
    );
  }

}