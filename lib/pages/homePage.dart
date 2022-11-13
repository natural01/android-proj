import 'package:data_bases_project/login/services/authServ.dart';
import 'package:data_bases_project/pages/infoPage.dart';
import 'package:data_bases_project/pages/startPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Moscow', 'London', 'Rome', 'New Yourk'];

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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140), child: CustomBarWidget()),
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

class CustomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appBarHeader.png'),
                fit: BoxFit.cover)),
        width: double.infinity,
        height: 160.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                'Where do you want to travel?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                DropdownButtonExample(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff356dfa),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          dropdownColor: Color(0xff356dfa),
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
          elevation: 16,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
