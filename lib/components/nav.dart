import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tacticle_app/models/style.dart';
import 'package:tacticle_app/screens/account.dart';
import 'package:tacticle_app/screens/home.dart';
import 'package:tacticle_app/screens/info.dart';
import 'package:tacticle_app/screens/scoreboard.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _pages = [
    HomePage(),
    const InfoPage(),
    const ScoreboardPage(),
    const AccountPage(),
  ];
  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint("This is the active page $_activePage");
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home_filled,
            size: 30,
            color: ColorTheme.blackColor,
          ),
          Icon(
            Icons.live_help,
            size: 30,
            color: ColorTheme.blackColor,
          ),
          Icon(
            Icons.leaderboard,
            size: 30,
            color: ColorTheme.blackColor,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: ColorTheme.blackColor,
          ),
        ],
        color: ColorTheme.navColor,
        buttonBackgroundColor: ColorTheme.whiteColor,
        backgroundColor: ColorTheme.whiteBgColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Stack(
        children: [
          Container(
              height: 250,
              width: double.infinity,
              color: ColorTheme.bgGreenColor),
          Opacity(
            opacity: 0.05,
            child: Container(
              height: 1000,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/bgApp1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: _pages[_activePage],
          ),
        ],
      ),
    );
  }
}
