import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thara_distributor/model/addressModel.dart';

class SupplierModel{
  final String name;
  final String id;
  final String email;
  final DocumentReference? reference;
  final bool delete;
  final List<String> setSearch;
  final DateTime createdTime;
  final String photoUrl;
  final int status;
  final String phoneNumber;
  final String gst;
  final Address address;


  SupplierModel({
    required this.name,
    this.reference,
    required this.email,
    required this.id,
    required this.createdTime,
    required this.status,
    required this.delete,
    required this.setSearch,
    required this.photoUrl,
    required this.address,
    required this.gst,
    required this.phoneNumber,
  });


  SupplierModel copyWith({
    String? name,
    String? id,
    String? email,
    bool? delete,
    DocumentReference? reference,
    List<String>? setSearch,
    DateTime? createdTime,
    String? photoUrl,
    int? status,
    String? phoneNumber,
    String?gst,
    Address? address
  }) {
    return SupplierModel(
      name:name??this.name,
      address: address ??this.address,
      id:id ?? this.id,
      email: email ?? this.email,
      delete:delete ?? this.delete,
      setSearch: setSearch ?? this.setSearch,
      reference:reference ?? this.reference,
      createdTime: createdTime ?? this.createdTime,
      status: status ?? this.status,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gst: gst ?? this.gst,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'reference': reference,
      'email' : email,
      'setSearch': setSearch,
      'delete': delete,
      'id': id,
      'status':status,
      'photoUrl':photoUrl,
      'createdTime': createdTime,
      'phoneNumber':phoneNumber,
      'gst':gst,
      "address":address.toJson(),
    };
  }

  factory SupplierModel.fromMap(dynamic map) {
    return SupplierModel(
      name:map['name'] as String,
      address:Address.fromMap(map['address']),
      email:map['email'] as String,
      delete:map['delete'] as bool,
      createdTime:map['createdTime'].toDate(),
      id:map['id'] as String,
      reference:map['reference'] as DocumentReference,
      setSearch:List<String>.from((map['setSearch']),),
      status: map['status']??0,
      photoUrl:map['photoUrl']??"",
      phoneNumber:map['phoneNumber']??"",
      gst: map['gst']??"",
);
}

}
