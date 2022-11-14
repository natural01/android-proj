import 'package:flutter/material.dart';

class CityDescriprionWidget extends StatelessWidget {
  const CityDescriprionWidget(
      {required this.cityName,
      required this.descriprion,
      required this.imageURL,
      required this.parentCounry,
      required this.comments,
      required this.commentsAuthor,
      required this.commentsRating});
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
        body: Container(
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xff356dfa),
                    child: IconButton(
                      icon: const Icon(
                        Icons.hotel,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xff356dfa),
                    child: IconButton(
                      icon: const Icon(
                        Icons.hotel,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xff356dfa),
                    child: IconButton(
                      icon: const Icon(
                        Icons.hotel,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xff356dfa),
                    child: IconButton(
                      icon: const Icon(
                        Icons.hotel,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
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
                          commentsAuthor,
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
              )
            ],
          ),
        ));
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
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
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
