import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class bottomNav extends StatelessWidget {
  PageController controller;

  bottomNav({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primeriColor = Theme.of(context).primaryColor;

    return BottomAppBar(
        color: primeriColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.animateToPage(0, duration: const Duration(milliseconds: 700), curve: Curves.bounceOut);
                      },
                      icon: Icon(Icons.home_filled),
                    ),
                    IconButton(
                      onPressed: () {controller.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.bounceOut);},
                      icon: Icon(Icons.bar_chart),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {controller.animateToPage(2, duration: const Duration(milliseconds: 400), curve: Curves.bounceOut);},
                      icon: Icon(Icons.person),
                    ),
                    IconButton(
                      onPressed: () {controller.animateToPage(4, duration: const Duration(milliseconds: 400), curve: Curves.bounceOut);},
                      icon: Icon(Icons.bookmark),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
