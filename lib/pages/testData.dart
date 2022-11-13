import 'package:data_bases_project/pages/infoPage.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataList extends StatelessWidget {
  DataList({super.key});

  final dataList = const <CardWidget>[
    CardWidget(
        Text1: 'Москва',
        Text2: 'Москва сабтайтл',
        imageURL:
            'data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
    CardWidget(
        Text1: 'Питер',
        Text2: 'Питер сабтайтл',
        imageURL:
            'https://russo-travel.ru/upload/medialibrary/969/969defb95e9e41cff15fe187449d9531.jpg'),
    CardWidget(
        Text1: 'Сахалин',
        Text2: 'Сахалин сабтайтл',
        imageURL:
            'https://cdn.culture.ru/images/79fdea78-38f7-5c10-8d29-107e01387bb4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
