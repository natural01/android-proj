import 'package:data_bases_project/database/database.dart';
import 'package:data_bases_project/login/services/authServ.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HotelDescriptionWidget.dart';

class GetBoxOffset extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;
  const GetBoxOffset({super.key, required this.child, required this.offset});

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState(this.child);
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  final Widget child;
  Offset offset = Offset(0.0, 0.0);
  GlobalKey widgetKey = GlobalKey();

  _GetBoxOffsetState(this.child);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}

class CityDescriprionWidget extends StatefulWidget {
  const CityDescriprionWidget(
      {required this.cityName,
      required this.descriprion,
      required this.imageURL,
      required this.parentCounry,
      this.comments,
      this.commentsAuthor,
      this.commentsRating});
  final cityName;
  final descriprion;
  final imageURL;
  final parentCounry;
  final comments;
  final commentsAuthor;
  final commentsRating;

  @override
  State<CityDescriprionWidget> createState() => _CityDescriprionWidgetState();
}

class _CityDescriprionWidgetState extends State<CityDescriprionWidget> {
  List<double> item = [];
  late ScrollController scrollController;
  double valueHotel = 0.0;
  double valueRest = 0.0;
  double valueAttract = 0.0;
  final User? user = fAuth.currentUser;

  @override
  void initState() {
    scrollController = ScrollController();
    item = List.generate(4, (index) => index.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      controller: scrollController,
      child: Container(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(widget.imageURL),
                        fit: BoxFit.cover)),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        scrollController: scrollController,
                        value: valueAttract,
                      ),
                      IncludedIconWidget(
                        icon: Icons.hotel,
                        name: 'Hotels',
                        scrollController: scrollController,
                        value: valueHotel,
                      ),
                      IncludedIconWidget(
                        icon: Icons.restaurant,
                        name: 'Restaurants',
                        scrollController: scrollController,
                        value: valueRest,
                      ),
                      IncludedIconWidget(
                        icon: Icons.attractions,
                        name: 'Attractions',
                        scrollController: scrollController,
                        value: valueAttract,
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffe8eef7),
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
                  const Text(
                    'Rating & Reviews',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff151a22),
                    ),
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffe8eef7),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // widget.commentsAuthor ?? '',
                                    user!.displayName
                                        .toString(), //Дергать из бд конекретный displayName
                                    style: const TextStyle(
                                        fontSize: 20, color: Color(0xff8792a6)),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Color(0xffffb006)),
                                      Text(
                                        widget.commentsRating.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff8792a6)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'A city-state located on islands in Southeast Asia, separated from the southern tip of the Malacca Peninsula by the narrow Strait of Johor. It borders with the Sultanate of Johor, which is part of Malaysia, and with the province of Riau Island, which is part of Indonesia. Singapore is considered the second safest city on Earth after Tokyo.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4a627f),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBoxOffset(
                    offset: (offset) {
                      valueHotel = offset.dy;
                      IncludedIconWidget(
                        name: 'Hotels',
                        icon: Icons.abc,
                        scrollController: scrollController,
                        value: valueHotel,
                      );
                    },
                    child: const Text(
                      'Hotels',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff151a22),
                      ),
                    ),
                  ),
                  StreamBuilder<List<Hotel>>(
                      stream: readHotel(widget.cityName),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong!');
                        } else if (snapshot.hasData) {
                          final hotels = snapshot.data!;
                          return Container(
                            height: 140,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  hotels.map(builtHotleCardWidget).toList(),
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBoxOffset(
                    offset: (offset) {
                      valueRest = offset.dy;
                      IncludedIconWidget(
                        name: 'Restaurants',
                        icon: Icons.abc,
                        scrollController: scrollController,
                        value: valueRest,
                      );
                    },
                    child: const Text(
                      'Restaurants',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff151a22),
                      ),
                    ),
                  ),
                  StreamBuilder<List<Cafe>>(
                      stream: readCafe(widget.cityName),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong!');
                        } else if (snapshot.hasData) {
                          final cafes = snapshot.data!;
                          return Container(
                            height: 140,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: cafes.map(builtCafeCardWidget).toList(),
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBoxOffset(
                    offset: (offset) {
                      valueAttract = offset.dy;
                      IncludedIconWidget(
                        name: 'Attraction',
                        icon: Icons.abc,
                        scrollController: scrollController,
                        value: valueAttract,
                      );
                    },
                    child: const Text(
                      'Attraction',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff151a22),
                      ),
                    ),
                  ),
                  StreamBuilder<List<Attraction>>(
                      stream: readAttraction(widget.cityName),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong!');
                        } else if (snapshot.hasData) {
                          final attraction = snapshot.data!;
                          return Container(
                            height: 140,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: attraction
                                  .map(builtAttractionCardWidget)
                                  .toList(),
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

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
    );

Widget builtAttractionCardWidget(Attraction attraction) => AttractionWidget(
      description: attraction.descriotion,
      name: attraction.name,
      picture: attraction.picture,
    );

class HotelCardWidget extends StatelessWidget {
  final description;
  final name;
  final picture;
  final rating;
  const HotelCardWidget({
    required this.description,
    required this.name,
    required this.picture,
    required this.rating,
    Key? key,
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
                Container(
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
  final scrollController;
  double value;
  IncludedIconWidget(
      {required this.icon,
      required this.name,
      required this.scrollController,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 24),
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
                  onPressed: () {
                    scrollController.animateTo(value,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
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
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                Container(
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
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                Container(
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
