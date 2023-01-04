import 'package:crypto_exchange_flutter/ui/homePage.dart';
import 'package:crypto_exchange_flutter/ui/marketViewPage.dart';
import 'package:crypto_exchange_flutter/ui/profilePage.dart';
import 'package:crypto_exchange_flutter/ui/signUpScreen.dart';
import 'package:crypto_exchange_flutter/ui/ui_helper/bottomNav.dart';
import 'package:crypto_exchange_flutter/ui/watchList.dart';
import 'package:flutter/material.dart';

class mainWrapper extends StatefulWidget {
  const mainWrapper({Key? key}) : super(key: key);

  @override
  State<mainWrapper> createState() => _mainWrapperState();
}

class _mainWrapperState extends State<mainWrapper> {
  final PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  bottomNav(controller: _myPage,),
      body: PageView(
        controller: _myPage,
        children: [homePage(), marketViewPage(),signUpScreen(),watchList()],
      ),
    );
  }
}
