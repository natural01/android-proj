import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

User? inputData() {
  final User? user = auth.currentUser;
  final uid = user?.uid;
  return user;
}

Stream<List<Country>> readCountry() => FirebaseFirestore.instance
    .collection('Country')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => Country.fromJsonCountry(doc.data()))
        .toList());

Stream<List<Town>> readTown(String countryName) => FirebaseFirestore.instance
    .collection('Town')
    .where('Id country', isEqualTo: countryName)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Country.fromJsonTown(doc.data())).toList());

Stream<List<Hotel>> readHotel(String townName) => FirebaseFirestore.instance
    .collection('Hotel')
    .where('Id Town', isEqualTo: townName)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Hotel.fromJsonHotel(doc.data())).toList());

Stream<List<Cafe>> readCafe(String townName) => FirebaseFirestore.instance
    .collection('Cafe')
    .where('Id town', isEqualTo: townName)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Cafe.fromJsonCafe(doc.data())).toList());

Stream<List<Attraction>> readAttraction(String townName) =>
    FirebaseFirestore.instance
        .collection('Sight')
        .where('Id town', isEqualTo: townName)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Attraction.fromJsonAttraction(doc.data()))
            .toList());

class Hotel {
  final String? descriotion;
  final String? idTown;
  final String? name;
  final String? picture;
  final String? rating;

  Hotel({
    required this.descriotion,
    required this.idTown,
    required this.name,
    required this.picture,
    required this.rating,
  });

  static Hotel fromJsonHotel(Map<String, dynamic> json) => Hotel(
        descriotion: json['Description'] ?? '',
        idTown: json['Id Town'] ?? '',
        name: json['Name'] ?? '',
        picture: json['Picture'] ?? '',
        rating: json['Rating'] ?? '*',
      );
}

class Cafe {
  final String? descriotion;
  final String? idTown;
  final int? idPosition;
  final String? name;
  final String? picture;

  Cafe({
    required this.descriotion,
    required this.idTown,
    required this.idPosition,
    required this.name,
    required this.picture,
  });

  static Cafe fromJsonCafe(Map<String, dynamic> json) => Cafe(
        descriotion: json['Description'] ?? '',
        idTown: json['Id town'] ?? '',
        idPosition: json['Id position'] ?? 0,
        name: json['Name'] ?? '',
        picture: json['Picture'] ?? '',
      );
}

class Attraction {
  final String? descriotion;
  final String? idTown;
  final int? idPosition;
  final String? name;
  final String? picture;

  Attraction({
    required this.descriotion,
    required this.idTown,
    required this.idPosition,
    required this.name,
    required this.picture,
  });

  static Attraction fromJsonAttraction(Map<String, dynamic> json) => Attraction(
        descriotion: json['Description'] ?? '',
        idTown: json['Id Town'] ?? '',
        idPosition: json['Id position'] ?? 0,
        name: json['Name'] ?? '',
        picture: json['Picture'] ?? '',
      );
}

class Town {
  final String? description;
  final String? idCountry;
  final String? name;
  final String? pucture;

  Town({
    required this.description,
    required this.idCountry,
    required this.name,
    required this.pucture,
  });
}

class Country {
  String? description = '';
  final String? idPart;
  final String? name;
  final String? imgURl;

  Country({
    required this.description,
    required this.idPart,
    required this.imgURl,
    required this.name,
  });

  // Map<String, dynamic> toJson() => {
  //       'Description': description,
  //       'Id part': idPart,
  //       'Name': name,
  //       'Picture': imgURl,
  //     };

  static Country fromJsonCountry(Map<String, dynamic> json) => Country(
        description: json['Description'] ?? '',
        idPart: json['Id part'] ?? '',
        imgURl: json['Picture'] ?? '',
        name: json['Name'] ?? '',
      );

  static Town fromJsonTown(Map<String, dynamic> json) => Town(
        description: json['Description'] ?? '',
        idCountry: json['Id country'] ?? '',
        name: json['Name'] ?? '',
        pucture: json['Picture'] ?? '',
      );
}
