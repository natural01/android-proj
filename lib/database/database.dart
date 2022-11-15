import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
