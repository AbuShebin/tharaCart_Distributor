import 'package:cloud_firestore/cloud_firestore.dart';

SalesManagerModel? salesManagerModel;
class SalesManagerModel{
  final String name;
  final String userName;
  final String password;
  final String id;
  final String email;
  final DocumentReference? reference;
  final bool delete;
  final List<String> setSearch;
  final DateTime createdTime;
  final String photoUrl;
  final int status;
  final String wareHouseId;
  final String? salesManagerId;
  final String phoneNumber;
  final String role;
  final bool online;
  final DateTime lastseen;


  SalesManagerModel({
    required this.name,
    required this.userName,
    required this.role,
    required this.password,
    this.reference,
    required this.email,
    required this.id,
    required this.createdTime,
    required this.status,
    required this.delete,
    required this.setSearch,
    required this.photoUrl,
    this.salesManagerId,
    required this.wareHouseId,
    required this.phoneNumber,
    required this.online,
    required this.lastseen,
  });


  SalesManagerModel copyWith({
    String? name,
    String? userName,
    String? role,
    String? password,
    String? id,
    String? email,
    bool? delete,
    DocumentReference? reference,
    List<String>? setSearch,
    DateTime? createdTime,
    String? photoUrl,
    int? status,
    String? salesManagerId,
    String? wareHouseId,
    String? phoneNumber,
    bool? online,
    DateTime? lastseen,
  }) {
    return SalesManagerModel(
      name:name??this.name,
      userName:userName??this.userName,
      role:role??this.role,
      password:password ?? this.password,
      id:id ?? this.id,
      email: email ?? this.email,
      delete:delete ?? this.delete,
      setSearch: setSearch ?? this.setSearch,
      reference:reference ?? this.reference,
      createdTime: createdTime ?? this.createdTime,
      status: status ?? this.status,
      photoUrl: photoUrl ?? this.photoUrl,
      salesManagerId: salesManagerId ?? this.salesManagerId,
      wareHouseId: wareHouseId ?? this.wareHouseId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      online: online?? this.online,
      lastseen: lastseen??this.lastseen,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userName': userName,
      'role': role,
      'password': password,
      'reference': reference,
      'email' : email,
      'setSearch': setSearch,
      'delete': delete,
      'id': id,
      'status':status,
      'photoUrl':photoUrl,
      'createdTime': createdTime,
      'salesManagerId':salesManagerId,
      'wareHouseId':wareHouseId,
      'phoneNumber':phoneNumber,
      'online':online,
      'lastseen':lastseen,
    };
  }

  factory SalesManagerModel.fromMap(dynamic map) {
    return SalesManagerModel(
      name:map['name'] as String,
      userName:map['userName'] as String,
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
      wareHouseId:map['wareHouseId']??"",
      salesManagerId:map['salesManagerId']??"",
      phoneNumber:map['phoneNumber']??"",
      online: map['online']  ?? false,
      lastseen: map['lastseen']==null?DateTime.now():map['lastseen'].toDate(),
);
}

}
