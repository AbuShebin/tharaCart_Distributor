import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thara_distributor/core/constant/colorContants.dart';
import 'package:thara_distributor/feature/homepage/screen/profile/profile.dart';
import 'package:thara_distributor/feature/order/screens/orderHistory.dart';
import '../../login/screen/splash_screen.dart';
import 'home/home_page.dart';

final bottomNavProvider = StateProvider<int>((ref) => 0);

class NavBarPage extends ConsumerStatefulWidget {
  const NavBarPage({super.key});
  @override
  ConsumerState<NavBarPage> createState() => _NavBarPageState();
}

final pageProvider = StateProvider<List>((ref) => [
      const HomePage(),
      const OrderHistory(),
      const Profile(),
    ]);
final bottomIconProvider =
    StateProvider<List<BottomNavigationBarItem>>((ref) => [
          const BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              )),
          const BottomNavigationBarItem(
              label: "History", icon: Icon(Icons.history_sharp)),
          const BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person,
              )),
        ]);

class _NavBarPageState extends ConsumerState<NavBarPage> {
  ColorPallete colorPallete=ColorPallete();

  void onTap(int index) {
    ref.read(bottomNavProvider.notifier).update((state) => index);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    int currentintex = ref.watch(bottomNavProvider);
    final Pages = ref.watch(pageProvider);
    return Scaffold(
      body: Pages[currentintex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorPallete.kHomePageTileTextColor,
        currentIndex: currentintex,
        showSelectedLabels: true,
        selectedItemColor: colorPallete.kNavbarSelectedColor,
        unselectedItemColor: const Color(0x8A000000),
        showUnselectedLabels: false,
        onTap: onTap,
        elevation: 2,
        items: ref.watch(bottomIconProvider),
      ),
    );
  }
}
