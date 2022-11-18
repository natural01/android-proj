import 'package:flutter/material.dart';
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
                title: 'Moscow',
                parentCountry: 'Russia',
                comments: 'Test comment',
                commentsAuthor: 'John Doe',
                commentsRating: 4.5,
                descriprion:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                imageURL:
                    'https://upload.wikimedia.org/wikipedia/commons/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg',
                isFavorite: false
            );
          }),
    );
  }
}
