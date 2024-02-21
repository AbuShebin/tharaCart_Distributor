import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import '../../../login/controller/login_controller.dart';
import '../../../login/repository/login_repository.dart';
import '../../../login/screen/login_screen.dart';
import '../../../login/screen/splash_screen.dart';
import '../../controller/home_controller.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  ColorPallete  colorPallete=ColorPallete();
  logOut() {
    ref.read(loginControllerProvider.notifier).logout(context);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorPallete.kscaffoldBackground,
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return ref.watch(getDistributorProvider(currentUserId)).when(
              data: (data) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                      Text(data.name,
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20.0,
                        width: 150.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.teal.shade900,
                              ),
                              title: Text(
                                data.phoneNumber,
                                style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontFamily: 'SourceSans',
                                    fontSize: 20.0),
                              ))),
                      Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.email,
                              color: Colors.teal.shade900,
                            ),
                            title: Text(
                              data.email,
                              style: TextStyle(
                                  fontFamily: 'SourceSans',
                                  fontSize: 18.0,
                                  color: Colors.teal.shade900),
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Logout"),
                              content: const Text("Are you sure you want to logout?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    logOut();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                          (route) => false,
                                    );
                                  },
                                  child: const Text("Logout"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                          child: Text(
                        'LOGOUT',
                        style: TextStyle(color: Colors.black),
                      )),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                return CircularProgressIndicator();
              },
              loading: () => CircularProgressIndicator());
        }),
      ),
    );
  }
}
