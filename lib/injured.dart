import 'package:flutter/material.dart';

import 'myGame.dart';

class Injured extends StatelessWidget {
  final Game2DScreen game;
  const Injured({Key? key, required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery. of(context). size. height ,
        width: MediaQuery. of(context). size. width ,
        decoration: BoxDecoration(color: Colors.red.withOpacity(0.3)),
        child: Padding(
            padding:  EdgeInsets.symmetric(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [Text(' ')],
            ),
          ),        
      ),
    );
  }
}