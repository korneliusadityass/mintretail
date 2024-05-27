import 'package:coba1/src/core/routeing/route.dart';
import 'package:flutter/material.dart';

class NavbarPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavbarPage({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.home,
              );
            },
            icon: const Column(
              children: [
                Icon(
                  Icons.home_filled,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Column(
              children: [
                Image.asset(
                  'asset/image/solar_calculator-bold.png',
                  width: 24,
                  height: 24,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Center(
                  child: Text(
                    'Open Payment',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          label: 'Open Payment',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.history,
              );
            },
            icon: Column(
              children: [
                Image.asset(
                  'asset/image/history.png',
                  width: 24,
                  height: 24,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: const Column(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
