import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_uas/main.dart';
import '../class/meme.dart';
import 'package:http/http.dart' as http;

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
  bool _alreadylike = false;

  Future<String> fetchData() async {
    final response = await http
        .post(Uri.parse('https://ubaya.fun/flutter/160419063/meme/getmemes.php'),
        body: {'iduser': id_user}); //untuk mengirim data
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

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
                FutureBuilder(
                  future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text("Error! ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          return widMemes(snapshot.data.toString());
                        } else {
                          return const Text("No data");
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                )
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
            elevation: 15,
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(memes[index].url),
                Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.favorite, color: (_alreadylike) ? Colors.red: Colors.grey,)
                              ),
                              TextSpan(
                                  text: '  $memes[index].likes likes'
                              ),
                            ]
                        )
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble, color: Colors.blue,),
                          tooltip: 'Add Comment',
                          onPressed: () {
                            //  buka halaman chat
                          },
                        ),
                      ],
                    ),
                ),
              ],
            ),
          );
        }
    );
  }

}