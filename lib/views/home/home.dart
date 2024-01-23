import 'package:esgrow/models/app_context.dart';
import 'package:esgrow/views/accounts/accounts.dart';
import 'package:esgrow/views/escrow/escrow.dart';
import 'package:esgrow/views/history/history.dart';
import 'package:esgrow/views/home/components/home_navigation.dart';
import 'package:esgrow/views/home/homepage.dart';
import 'package:esgrow/views/profile/profile.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  AppContext appContext;

  Homepage({super.key, required this.appContext});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      HomeScreen(),
      HistoryPage(),
      EscrowPage(appContext: widget.appContext),
      AccountsPage(),
      ProfilePage(context: widget.appContext)
    ];
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(
        appContext: widget.appContext,
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
