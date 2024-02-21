import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thara_distributor/model/orderModel.dart';
import 'addressModel.dart';

DistributorModel? distributorModel;
class DistributorModel{
  final String name;
  final String userName;
  final Address address;
  final String password;
  final String id;
  final String email;
  final String gst;
  final DocumentReference? reference;
  final bool delete;
  final List<String> setSearch;
  final DateTime createdTime;
  final String photoUrl;
  final int status;
  final String salesManId;
  final String phoneNumber;
  final String role;
   List<OrderBagModel> bag;

  DistributorModel({
    required this.name,
    required this.userName,
    required this.address,
    required this.role,
    required this.gst,
    required this.password,
    this.reference,
    required this.email,
    required this.id,
    required this.createdTime,
    required this.status,
    required this.delete,
    required this.setSearch,
    required this.photoUrl,
    required this.salesManId,
    required this.phoneNumber,
    required this.bag,
  });

  DistributorModel copyWith({
    String? name,
    Address? address,
    String? role,
    String? password,
    String? id,
    String? gst,
    String? email,
    String? salesManId,
    bool? delete,
    DocumentReference? reference,
    List<String>? setSearch,
    DateTime? createdTime,
    String? photoUrl,
    int? status,
    String? phoneNumber,
    String? userName,
    List<OrderBagModel>? bag,
  }) {
    return DistributorModel(
      name:name??this.name,
      address:address??this.address,
      role:role??this.role,
      gst:gst??this.gst,
      password:password ?? this.password,
      id:id ?? this.id,
      email: email ?? this.email,
      delete:delete ?? this.delete,
      setSearch: setSearch ?? this.setSearch,
      reference:reference ?? this.reference,
      createdTime: createdTime ?? this.createdTime,
      status: status ?? this.status,
      photoUrl: photoUrl ?? this.photoUrl,
      salesManId: salesManId ?? this.salesManId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userName: userName ?? this.userName,
      bag: bag??this.bag,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
      'role': role,
      'gst': gst,
      'password': password,
      'reference': reference,
      'email' : email,
      'setSearch': setSearch,
      'delete': delete,
      'id': id,
      'status':status,
      'photoUrl':photoUrl,
      'createdTime': createdTime,
      'salesManId':salesManId,
      'phoneNumber':phoneNumber,
      'userName':userName,
      'bag':List.generate(bag.length, (index) =>bag[index].toJson()),
    };
  }

  factory DistributorModel.fromMap(dynamic map) {
    return DistributorModel(
        name:map['name'] as String,
        gst:map['gst'] as String,
        address:Address.fromMap(map['address']),
        role:map['role'] as String,
        password:map['password'] as String,
        email:map['email'] as String,
        delete:map['delete'] as bool,
        createdTime:map['createdTime'].toDate(),
        id:map['id'] as String,
        reference:map['reference'] as DocumentReference,
        setSearch:List<String>.from((map['setSearch']),),
        status: map['status']??0,
        photoUrl:map['photoUrl']??"",
        salesManId:map['salesManId']??"",
        phoneNumber:map['phoneNumber']??"",
        userName:map['userName']??"",
      bag: List.generate(map['bag'].length, (index) =>OrderBagModel.fromMap(map['bag'][index])),
);
    }
}