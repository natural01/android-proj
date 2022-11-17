import 'package:data_bases_project/database/database.dart';
import 'package:flutter/material.dart';

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

class HotelDescriprionWidget extends StatefulWidget {
  const HotelDescriprionWidget(
      {required this.HotelName,
        required this.descriprion,
        required this.imageURL,
      });
  final HotelName;
  final descriprion;
  final imageURL;

  @override
  State<HotelDescriprionWidget> createState() => _HotelDescriprionWidgetState();
}

class _HotelDescriprionWidgetState extends State<HotelDescriprionWidget> {
  List<double> item = [];
  late ScrollController scrollController;
  double valueHotel = 0.0;
  double valueRest = 0.0;
  double valueAttract = 0.0;

  @override
  void initState() {
    scrollController = ScrollController();
    item = List.generate(4, (index) => index.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8dfe2),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.imageURL),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  width: double.infinity,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.HotelName,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff151a22),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Color(0xffffb006)),
                                  Text('5', style: TextStyle(color: Color(0xffffb006))),
                                ],
                              ),
                            ]
                          ),
                        )
                      ],
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.place, size: 10),
                      Text(
                        'ул. Пушкина, д. Колотушкина',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff151a22),
                        ),
                      ),
                      Container(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.descriprion,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff4a627f),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

Widget builtHotleCardWidget(Hotel hotel) => HotelCardWidget(
  description: hotel.descriotion,
  name: hotel.name,
  picture: hotel.picture,
);

class HotelCardWidget extends StatelessWidget {
  final description;
  final name;
  final picture;
  const HotelCardWidget({
    required this.description,
    required this.name,
    required this.picture,
    Key? key,
  });

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
                    scrollController.animateTo(value - 200.00,
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