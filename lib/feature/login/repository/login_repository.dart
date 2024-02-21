import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thara_distributor/feature/cart/screens/cartPage.dart';
import '../../../core/constant/firebase_constants.dart';
import '../../../model/distributor_model.dart';
import '../../../core/provider/failure.dart';
import '../../../core/provider/firebase_provider.dart';
import '../../../core/provider/type_def.dart';

var currentUserId;
var currentUserName;

final loginRepositoryProvider = Provider((ref) => LoginRepository(
  firestore: ref.read(firestoreProvider), auth: ref.read(authProvider)));


class LoginRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  LoginRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  CollectionReference get _distributor =>
      _firestore.collection(FirebaseConstants.distributor);

  FutureEither<DistributorModel?> login(
      {required String username, required String password}) async {
    try {
print("userName: $username , password: $password");

      QuerySnapshot distributor = await _distributor
          .where('userName', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      if (distributor.docs.isEmpty) {
        throw "User does not exist";
      } else {
        print('in');
       
      var data = distributor.docs[0];
        currentUserId = data.id;
        currentUserName = data.get("userName");
        print("$currentUserName========================================");
       print("hi1");
        print(data.data());
        distributorModel = DistributorModel.fromMap(data.data());
      print("hi2");
      }
      return right(distributorModel);
    } on FirebaseException catch (e) {
      throw e.message ?? '';
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  getUser({ WidgetRef? ref}) {
    _distributor.doc(currentUserId).get().then((value) {
      distributorModel = DistributorModel.fromMap(value.data()! );
      if(distributorModel!.bag.isEmpty){
        ref?.read(cartEmptyCheckerProvider.notifier).update((state) => true);
      }else{
        ref?.read(cartEmptyCheckerProvider.notifier).update((state) => false);
      }
      // print('user data fetched ${distributorModel!.bag}');
    });
  }

  Stream<DistributorModel> getUserStream() {
    return _firestore
        .collection(FirebaseConstants.distributor)
        .doc(currentUserId)
        .snapshots()
        .map((event) => DistributorModel.fromMap(event.data() as Map<String, dynamic>));
  }

  Future logout() async {
    try {
      var prefs=await SharedPreferences.getInstance();
      prefs.remove("uid")??'';
      prefs.remove("userName")??'';
      currentUserId='';
      currentUserName='';
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  FutureEither<DistributorModel?> checkKeepLogin() async {
    try {
      
      var prefs = await SharedPreferences.getInstance();
      if(prefs.getString('uid')!=null){
        String? uid=prefs.getString("uid");
        currentUserId=uid;
        print('userIdchecked :$currentUserId');
        distributorModel=getUser();
        print('dddddddddd');
        return right(distributorModel);
      }else{
        return left(Failure("userId  not found"));
      }

    } on FirebaseException catch (e) {
      throw e.message ?? '';
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  
}