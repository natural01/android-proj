import 'package:data_bases_project/database/database.dart';
import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  String _data = '';

  String get getData => _data;

  void changeData(String newData) {
    _data = newData;

    notifyListeners();
  }
}

class TestDataWidget extends StatelessWidget {
  const TestDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All country data')),
      body: StreamBuilder<List<Country>>(
        stream: readCountry(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            final countrys = snapshot.data!;

            return ListView(
              children: countrys.map(buildData).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buildData(Country country) => ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(country.imgURl!),
      ),
      title: Text(country.name!),
      subtitle: Text(country.description!),
    );
