import 'package:data_bases_project/pages/cityDescriprion.dart';
import 'package:flutter/material.dart';

class FirstScreenWidget extends StatelessWidget {
  const FirstScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: const CardWidget(
            title: 'Moscow',
            parentCountry: 'Russia',
            comments: 'Test comment',
            commentsAuthor: 'John Doe',
            commentsRating: 4.5,
            descriprion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            imageURL:
                'https://upload.wikimedia.org/wikipedia/commons/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg'),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final title;
  final descriprion;
  final parentCountry;
  final imageURL;
  final comments;
  final commentsAuthor;
  final commentsRating;

  const CardWidget(
      {Key? key,
      required this.title,
      required this.descriprion,
      required this.imageURL,
      required this.parentCountry,
      required this.comments,
      required this.commentsAuthor,
      required this.commentsRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityDescriprionWidget(
                      cityName: title,
                      descriprion: descriprion,
                      imageURL: imageURL,
                      parentCounry: parentCountry,
                      comments: comments,
                      commentsAuthor: commentsAuthor,
                      commentsRating: commentsRating,
                    )));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  imageURL,
                ),
                fit: BoxFit.cover,
              )),
          width: double.infinity,
          height: 200,
          child: Container(
            margin: const EdgeInsets.only(top: 90),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    )),
                Text(descriprion,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ))
              ],
            ),
          )),
    );
  }
}
