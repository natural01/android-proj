import 'package:data_bases_project/login/lendingPage.dart';
import 'package:data_bases_project/login/userWidget.dart';
import 'package:data_bases_project/pages/infoPage.dart';

import 'package:data_bases_project/pages/startPage.dart';

import 'package:data_bases_project/login/services/authServ.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserWidget?>.value(
      value: AuthSevrice().currentUser,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LandingPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool enteredParameters = false;
  late final List<Widget> _widgetOptions = <Widget>[
    const FirstScreenWidget(),
    const Text(
      'Index 1: Business',
    ),
    const Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A4A66),
        title: const Text(
          'Place of interests',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              color: Colors.white,
              Icons.settings,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Выберите местопопложение"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.place),
                          hintText: "Выберите часть света",
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.flag),
                          hintText: "Выберите страну",
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.build),
                          hintText: "Выберите город",
                        )),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Approve'),
                      onPressed: () {
                        enteredParameters = true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CurrentCategoriePage(
                                        titlePage: "current title")));
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
              onPressed: () {
                AuthSevrice().logOut();
              },
              icon: const Icon(Icons.logout)),
        ],
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Route',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange[600],
        onTap: _onItemTapped,
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff3A4A66),
      child: ListView(
        children: <Widget>[
          Container(
            height: 70,
            child: const Center(
              child: DrawerHeader(
                child: Text('Categories',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
              ),
            ),
          ),
          ListTile(
              title: const Text(
                "Places of interests",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.photo, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Hotels",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.hotel, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Restaurants",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.restaurant, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Night scene",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.nightlife, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Shopping",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.shopping_bag, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Parking",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.local_parking, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Beaches",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.beach_access, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Recreation",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.sunny, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          ListTile(
              title: const Text(
                "Transportation",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              leading:
                  const Icon(Icons.emoji_transportation, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentCategoriePage(
                            titlePage:
                                "current title"))); // TODO Передавать правильный title
              }),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
