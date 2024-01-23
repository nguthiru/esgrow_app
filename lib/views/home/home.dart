import 'package:esgrow/views/accounts/accounts.dart';
import 'package:esgrow/views/escrow/escrow.dart';
import 'package:esgrow/views/history/history.dart';
import 'package:esgrow/views/home/components/home_navigation.dart';
import 'package:esgrow/views/home/homepage.dart';
import 'package:esgrow/views/profile/profile.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = [
    HomeScreen(),
    HistoryPage(),
    EscrowPage(),
    AccountsPage(),
    ProfilePage()
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(
        activeIndex: activeIndex,
        height: kBottomNavigationBarHeight + 20.0,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: activeIndex,
        children: pages,
      ),
    );
  }
}
