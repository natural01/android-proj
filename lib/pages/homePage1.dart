import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_bases_project/login/services/authServ.dart';
import 'package:data_bases_project/pages/infoPage.dart';
import 'package:data_bases_project/pages/testDataPage.dart';
import 'package:flutter/material.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  int _selectedIndex = 0;
  bool enteredParameters = false;
  late final List<Widget> _widgetOptions = <Widget>[
    const TestDataWidget(),
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
            Row(
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
                IconButton(
                    onPressed: () {
                      AuthSevrice().logOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
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
  var selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff356dfa),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Country').snapshots(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading');
            } else {
              List<DropdownMenuItem> currencyItems = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                DocumentSnapshot snap = snapshot.data!.docs[i];
                currencyItems.add(
                  DropdownMenuItem(
                    child: Text(
                      '${snap.id}',
                      //style:
                    ),
                    value: snap.id,
                  ),
                );
              }
              return DropdownButton(
                value: selectedCurrency,
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
                onChanged: (currencyValue) {
                  final snackBar = SnackBar(
                    content: Text(
                      'You choosen country is $currencyValue',
                      style: TextStyle(
                        color: Color(0xff11b719),
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    selectedCurrency = currencyValue;
                  });
                },
                items: currencyItems,
              );
            }
          }),
        ));
  }
}
