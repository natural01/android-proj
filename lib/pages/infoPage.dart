import 'package:data_bases_project/database/database.dart';
import 'package:data_bases_project/login/services/authServ.dart';
import 'package:data_bases_project/pages/cityDescriprion.dart';
import 'package:data_bases_project/pages/testDataPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreenWidget extends StatefulWidget {
  const FirstScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreenWidget> createState() => _FirstScreenWidgetState();
}

class _FirstScreenWidgetState extends State<FirstScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Town>>(
      stream: readTown(context.watch<Data>().getData),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong!');
        } else if (context.watch<Data>().getData == '') {
          return AwaitWidget();
        } else if (snapshot.hasData) {
          final towns = snapshot.data!;
          return ListView(
            children: towns.map(builtCardWidget).toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Widget builtCardWidget(Town town) => CardWidget(
      title: town.name,
      descriprion: town.description,
      parentCountry: town.idCountry,
      imageURL: town.pucture,
    );

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
      this.comments,
      this.commentsAuthor,
      this.commentsRating})
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
          margin: const EdgeInsets.only(top: 12),
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

class AwaitWidget extends StatelessWidget {
  final User? user = fAuth.currentUser;

  AwaitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.toString()),
              Text('Traveller'),
              Text('Выберите страну'),
            ],
          ),
        ),
      ),
    );
  }
}
