
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thara_distributor/model/addressModel.dart';

class SuperMarketModel {
 final String name;
 final Address address;
  String phoneNumber;
  String id;
  DocumentReference? reference;
  double lat;
  double long;
 final bool delete;
 final List<String> search;
 final DateTime createdTime;
 final String? photoUrl;
 final int status;

  SuperMarketModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.id,
    this.reference,
    required this.lat,
    required this.long,
    required this.createdTime,
    required this.delete,
    this.photoUrl,
    required this.status,
    required this.search
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address.toJson(),
      'phoneNumber': phoneNumber,
      'id': id,
      'reference': reference,
      'lat':lat,
      'long':long,
      'delete':delete,
      'search':search,
      'createdTime':createdTime,
      'photoUrl':photoUrl,
      'status':status,
    };
  }

  factory SuperMarketModel.fromMap(Map<String, dynamic> map) {
    return SuperMarketModel(
      name: map['name'] ??"",
      address:Address.fromMap(map['address']),
      phoneNumber: map['phoneNumber']??"",
      id: map['id'] ??"",
      reference: map['reference'] as DocumentReference?,
      lat: double.tryParse(map['lat'].toString())??0.0,
      long:double.tryParse(map['long'].toString())??0.0,
      status:map['status'] ??0,
      photoUrl:map['photoUrl'] ??"",
      createdTime:map['createdTime'].toDate(),
      delete:map['delete']??false,
      search: List<String>.from((map['search']),)
    );
  }

  SuperMarketModel copyWith({
    String? name,
    Address? address,
    String? phoneNumber,
    String? id,
    DocumentReference? reference,
    double?lat,
    double?long,
    int?status,
    String?photoUrl,
    DateTime?createdTime,
    bool?delete,
    List<String>?search,
  }) {
    return SuperMarketModel(
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      id: id ?? this.id,
      reference: reference ?? this.reference,
      lat: lat??this.lat,
      long: long??this.long,
      search: search??this.search,
      delete: delete?? this.delete,
      status: status??this.status,
      createdTime: createdTime?? this.createdTime,
      photoUrl: photoUrl?? this.photoUrl
);
}
}
