import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_bases_project/database/database.dart';
import 'package:data_bases_project/login/services/authServ.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HotelDescriptionWidget.dart';

class CityDescriprionWidget extends StatefulWidget {
  const CityDescriprionWidget(
      {super.key,
      required this.cityName,
      required this.descriprion,
      required this.imageURL,
      required this.parentCounry,
      required this.isFavorite,
      this.comments,
      this.commentsAuthor,
      this.commentsRating});
  final cityName;
  final descriprion;
  final imageURL;
  final parentCounry;
  final isFavorite;
  final comments;
  final commentsAuthor;
  final commentsRating;

  @override
  State<CityDescriprionWidget> createState() => _CityDescriprionWidgetState();
}

class _CityDescriprionWidgetState extends State<CityDescriprionWidget> {
  List<double> item = [];
  final User? user = fAuth.currentUser;
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageURL), fit: BoxFit.cover)),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 35,
                          ),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (isFavorite == true) {
                                final docTown = FirebaseFirestore.instance
                                    .collection('Town')
                                    .doc(widget.cityName);
                                docTown.update({'isFavorite': false});
                                isFavorite = false;
                              } else {
                                final docTown = FirebaseFirestore.instance
                                    .collection('Town')
                                    .doc(widget.cityName);
                                docTown.update({'isFavorite': true});
                                isFavorite = true;
                              }
                            });
                          },
                          icon: const Icon(Icons.favorite),
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cityName,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(widget.parentCounry,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            const Icon(
                              Icons.location_city,
                              size: 35,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Included',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff151a22),
                  ),
                ),
                const Text(
                  'For more details press on the icons.',
                  style: TextStyle(fontSize: 18, color: Color(0xffaeb8c4)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IncludedIconWidget(
                      icon: Icons.flight,
                      name: 'Flight',
                    ),
                    IncludedIconWidget(
                      icon: Icons.hotel,
                      name: 'Hotels',
                    ),
                    IncludedIconWidget(
                      icon: Icons.restaurant,
                      name: 'Restaurants',
                    ),
                    IncludedIconWidget(
                      icon: Icons.attractions,
                      name: 'Attractions',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff151a22),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffe8eef7),
                  ),
                  width: double.infinity,
                  child: Text(
                    widget.descriprion,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a627f),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rating & Reviews',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff151a22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        addComment();
                      },
                      icon: const Icon(Icons.add_comment),
                    )
                  ],
                ),
                StreamBuilder<List<Comment>>(
                    stream: readComment(widget.cityName),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong!');
                      } else if (snapshot.hasData) {
                        final comment = snapshot.data!;
                        return SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                comment.map(builtCommentCardWidget).toList(),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Hotels',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff151a22),
                  ),
                ),
                StreamBuilder<List<Hotel>>(
                    stream: readHotel(widget.cityName),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong!');
                      } else if (snapshot.hasData) {
                        final hotels = snapshot.data!;
                        return SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: hotels.map(builtHotleCardWidget).toList(),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Restaurants',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff151a22),
                  ),
                ),
                StreamBuilder<List<Cafe>>(
                    stream: readCafe(widget.cityName),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong!');
                      } else if (snapshot.hasData) {
                        final cafes = snapshot.data!;
                        return SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: cafes.map(builtCafeCardWidget).toList(),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Attraction',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff151a22),
                  ),
                ),
                StreamBuilder<List<Attraction>>(
                    stream: readAttraction(widget.cityName),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong!');
                      } else if (snapshot.hasData) {
                        final attraction = snapshot.data!;
                        return SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: attraction
                                .map(builtAttractionCardWidget)
                                .toList(),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget builtCommentCardWidget(Comment comment) => CommentCardWidget(
        comment.comment,
        comment.rating,
        comment.userName,
        comment.townName,
      );

  Widget builtCafeCardWidget(Cafe cafe) => RestaurantsWidget(
        description: cafe.descriotion,
        name: cafe.name,
        picture: cafe.picture,
      );

  Widget builtHotleCardWidget(Hotel hotel) => HotelCardWidget(
        description: hotel.descriotion,
        name: hotel.name,
        picture: hotel.picture,
        rating: hotel.rating,
        townName: widget.cityName,
      );

  Widget builtAttractionCardWidget(Attraction attraction) => AttractionWidget(
        description: attraction.descriotion,
        name: attraction.name,
        picture: attraction.picture,
      );

  Future<void> addComment() async {
    final User? user = fAuth.currentUser;
    TextEditingController _commentController = TextEditingController();
    TextEditingController _ratingController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Comment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Enter your comment'),
                TextField(
                  controller: _commentController,
                  obscureText: false,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Enter a comment',
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _ratingController,
                  obscureText: false,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Enter a rating',
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                  FirebaseFirestore.instance.collection('Note comment').add({
                    'Comment': _commentController.text,
                    'Rating': _ratingController.text,
                    'Town': widget.cityName,
                    'UserName': user!.displayName,
                  });
                }),
          ],
        );
      },
    );
  }

  Container CommentCardWidget(
      String? commentaty, String? rating, String? userName, String? townName) {
    return Container(
        height: 200,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffe8eef7),
        ),
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userName!,
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xff8792a6)),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xffffb006)),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                            fontSize: 15, color: Color(0xff8792a6)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                commentaty!,
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4a627f),
                ),
              ),
            ],
          ),
        ));
  }
}

class HotelCardWidget extends StatelessWidget {
  final description;
  final name;
  final picture;
  final rating;
  final townName;
  const HotelCardWidget({
    super.key,
    required this.description,
    required this.name,
    required this.picture,
    required this.rating,
    required this.townName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(picture), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xffffb006)),
                    Text(rating,
                        style: const TextStyle(
                          color: Color(0xffffb006),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelDescriprionWidget(
                                  townName: townName,
                                  imageURL: picture,
                                  descriprion: description,
                                  HotelName: name,
                                )));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12)),
                  child: const Text('More'),
                )
              ],
            )
          ],
        ));
  }
}

class IncludedIconWidget extends StatelessWidget {
  final icon;
  final name;
  const IncludedIconWidget({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        CircleAvatar(
          radius: 36,
          backgroundColor: const Color(0xff356dfa),
          child: CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xff356dfa),
              child: IconButton(
                icon: Icon(
                  icon,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class RestaurantsWidget extends StatelessWidget {
  final description;
  final name;
  final picture;
  const RestaurantsWidget(
      {super.key,
      required this.description,
      required this.name,
      required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(picture), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Row(
                  children: const [
                    Icon(Icons.star, color: Color(0xffffb006)),
                    Text('5', style: TextStyle(color: Color(0xffffb006))),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12)),
                  child: const Text('More'),
                )
              ],
            )
          ],
        ));
  }
}

// достопримечательности
class AttractionWidget extends StatelessWidget {
  final description;
  final name;
  final picture;
  const AttractionWidget(
      {super.key,
      required this.description,
      required this.name,
      required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(picture), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Row(
                  children: const [
                    Icon(Icons.star, color: Color(0xffffb006)),
                    Text('5', style: TextStyle(color: Color(0xffffb006))),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12)),
                  child: const Text('More'),
                )
              ],
            )
          ],
        ));
  }
}
