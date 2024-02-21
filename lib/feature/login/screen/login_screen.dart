import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thara_distributor/feature/login/screen/splash_screen.dart';
import '../../../core/common/util.dart';
import '../controller/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  login() async {
    ref.read(loginControllerProvider.notifier).login(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        context: context);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', true);
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              ),
          child: Column(
            children: [
              const SizedBox(height: 150),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9, top: 90),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                      width: 300,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid username';
                          }
                          return null;
                        },
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.brown[500]),
                          labelStyle: TextStyle(color: Colors.brown[500]),
                            hintText: ' username',
                            labelText: 'username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9, top: 20),
                child: Container(
                    width: 300,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null && value.length < 8) {
                          return 'Enter the valid password!';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: (passVisible == true) ? false : true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          labelText: "password",
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            icon: Icon((passVisible == true)
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passVisible = !passVisible;
                              });
                            },
                          )),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Container(
                    width: 150,
                    child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                        onPressed: () {
                          if (usernameController.text.trim() != '' &&
                              passwordController.text.trim() != '') {
                            login();
                            showSnackBar(context: context,text:  'login successfully');
                          } else {
                            usernameController.text.trim() == ''
                                ?
                            showSnackBar(context: context,text:  'please enter username')
                                : showSnackBar(context: context,text:  'please  enter password');
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ))),              ),
            ],
          ),
        ),
      ),
    );
  }
}
