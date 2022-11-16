import 'package:flutter/material.dart';

class CityDescriprionWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: CustomCityBarWidget(
              title: cityName,
              parentCountry: parentCounry,
            )),
        body: SingleChildScrollView(
          child: Container(
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
                  children: const [
                    IncludedIconWidget(
                      icon: Icons.flight,
                      name: 'Flight',
                    ),
                    IncludedIconWidget(
                      icon: Icons.hotel,
                      name: 'Hotel',
                    ),
                    IncludedIconWidget(
                      icon: Icons.car_rental,
                      name: 'Car rental',
                    ),
                    IncludedIconWidget(
                      icon: Icons.tour,
                      name: 'Tour',
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
                    descriprion,
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffe8eef7),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            commentsAuthor ?? '',
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff8792a6)),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xffffb006)),
                              Text(
                                commentsRating.toString(),
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
                        descriprion,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4a627f),
                        ),
                      ),
                    ],
                  ),
                ),
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
                Container(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return const HotelCardWidget();
                      }),
                    ))
              ],
            ),
          ),
        ));
  }
}

class HotelCardWidget extends StatelessWidget {
  const HotelCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('images/appBarHeader.png'), fit: BoxFit.cover),
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
                  child: const Text('Name',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
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

class IncludedIconWidget extends StatelessWidget {
  final icon;
  final name;
  const IncludedIconWidget({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

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
                  onPressed: () {},
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

class CustomCityBarWidget extends StatelessWidget {
  final title;
  final parentCountry;
  CustomCityBarWidget({required this.title, required this.parentCountry});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        color: Color(0xff1b3065),
        width: double.infinity,
        height: 160.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    Container(
                      width: 210,
                      child: Text(
                        title,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                parentCountry,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
