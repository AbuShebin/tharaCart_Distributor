import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/distributor_model.dart';
import '../../../core/common/show_upload.dart';
import '../../../core/common/util.dart';
import '../../homepage/screen/nav_bar.dart';
import '../repository/login_repository.dart';
import '../screen/login_screen.dart';

final loginControllerProvider = StateNotifierProvider<LoginController, bool>(
    (ref) => LoginController(
        loginRepository: ref.read(loginRepositoryProvider), ref: ref));

final userProvider = StateProvider<DistributorModel?>((ref) => null);

class LoginController extends StateNotifier<bool> {
  final LoginRepository _loginRepository;
  final Ref _ref;
  LoginController({
    required LoginRepository loginRepository,
    required Ref ref,
  })  : _loginRepository = loginRepository,
        _ref = ref,
        super(false);

  getUser({ WidgetRef? ref}){
    _loginRepository.getUser(ref: ref);
  }
  
  getUserStream(){
    _loginRepository.getUserStream();
  }

  Future<void> login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res =
        await _loginRepository.login(username: username, password: password);
    state = false;
    res.fold(
        (l) => showUploadMessage(
              context,
          'hello--------------------${l.message}',
            ),
        (r) async{
          ///shared prefs
           final SharedPreferences userDatas =
        await SharedPreferences.getInstance();

         print('userName : $currentUserName');
        print('id : $currentUserId');
        userDatas.setString("uid", currentUserId);
        userDatas.setString("name", currentUserName);
        ///end shared prefs
        
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavBarPage(),
              ),
              (route) => false,
            );
        }
            );
    showSnackBar(context: context,text:  "Login Successfully");
  }

  Future<void> checkKeepLogin(BuildContext context) async {
    final res = await _loginRepository.checkKeepLogin();
    res.fold(
      (l) async {
        print(l.message);
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      },

      (r) async {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NavBarPage()),
          (route) => false,
        );
      },
    );
  }

  Future<void> logout(BuildContext context) async {

    await _loginRepository.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false,
    );
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
