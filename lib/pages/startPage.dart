import 'package:flutter/material.dart';

import '../main.dart';
import 'infoPage.dart';

class CurrentCategoriePage extends StatelessWidget {
  final titlePage;

  const CurrentCategoriePage({super.key, required this.titlePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$titlePage'),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CardWidget(
              Text1: 'Title PlaceHolder',
              Text2: 'SubTitle PlaceHolder',
              imageURL:
                  'https://thumbs.dreamstime.com/b/%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%8C%D0%B5%D1%80-museo-nacional-de-arte-munal-%D0%B2-%D0%BC%D0%B5%D1%85%D0%B8%D0%BA%D0%BE-%D0%B4%D0%B2%D0%BE%D1%80%D1%86%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D0%BE%D0%B3%D0%BE-%D1%81%D0%BE%D0%BE%D0%B1%D1%89%D0%B5%D0%BD%D0%B8%D0%B9-144069612.jpg',
            );
          }),
    );
  }
}

// привет от никиты