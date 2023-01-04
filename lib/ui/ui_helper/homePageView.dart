
import 'package:flutter/material.dart';


class homePAgeView extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var controller;
   homePAgeView({Key? key,required this.controller}) : super(key: key);

  @override
  State<homePAgeView> createState() => _homePAgeViewState();
}

class _homePAgeViewState extends State<homePAgeView> {
  var images= [
        'images/a1.jpg',
        'images/a4.png',
        'images/a5.png',
    'images/a6.jpg',
    'images/a7.jpg',
    'images/a8.png',
    'images/a10.jpg',
    'images/a11.jpg',


  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        myPages(images[4]),
        myPages(images[1]),
        myPages(images[6]),
        myPages(images[7]),
        myPages(images[5]),

      ],
    );
  }
  Widget myPages(String image){
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Image(image: AssetImage(image),fit: BoxFit.cover,));
  }
}
