// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_uas/Screens/home.dart';
import 'package:project_uas/Screens/leaderboard.dart';
import 'package:project_uas/Screens/login.dart';
import 'package:project_uas/Screens/my_creation.dart';
import 'package:project_uas/Screens/setting.dart';
import 'package:project_uas/screens/addnewmeme.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = "";
String id_user = "";
String fName = "";
String lName = "";

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  username = prefs.getString("user_name") ?? '';
  fName = prefs.getString("fName") ?? '';
  lName = prefs.getString("lName") ?? '';
  id_user = prefs.getString("id_user") ?? '';

  return username;
}

void doLogout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("user_id");
  main();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkUser().then((String result) {
    if (result == '') {
      runApp(MyLogin());
    } else {
      username = result;
      runApp(MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'home': (context) => Home(),
        'leaderboard': (context) => Leaderboard(),
        'mycreation': (context) => MyCreation(),
        'setting': (context) => Setting(),
        'addnewmeme': (context) => AddNewMeme()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home(),
    MyCreation(),
    Leaderboard(),
    Setting()
  ];
  final List<String> _title = [
    'Home',
    'My Creation',
    'Leaderboard',
    'Settings'
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_title[_currentIndex]),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addnewmeme');
        },
        tooltip: 'Add New Meme',
        child: const Icon(Icons.add),
      ),
      drawer: myDrawer(),
      bottomNavigationBar:
          myButtonNavbar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  BottomNavigationBar myButtonNavbar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      fixedColor: Colors.teal,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "My Creation",
          icon: Icon(Icons.mood),
        ),
        BottomNavigationBarItem(
          label: "Leaderboard",
          icon: Icon(Icons.leaderboard_outlined),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(Icons.settings),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Drawer myDrawer() {
    return Drawer(
        elevation: 16.0,
        child: Row(children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("$fName $lName"),
                accountEmail: Text(username),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150'), //nanti diisi avatar orange
                ),
              ),
              Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endTop,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    doLogout();
                  },
                  tooltip: 'Log Out',
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.logout),
                ),
              ),
            ],
          ),
        ]));
  }
}
