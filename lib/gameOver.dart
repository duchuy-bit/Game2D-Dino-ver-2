import 'package:flutter/material.dart';

import 'myGame.dart';

class GameOver extends StatelessWidget {

  final Game2DScreen game;

  const GameOver({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),

        ),
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text('Game Over',style: TextStyle(fontFamily: 'Audiowide',fontSize: 30,color: Colors.white)),
                  Text('Your Scored: ${game.score}',style: TextStyle(fontFamily: 'Audiowide',fontSize: 30,color: Colors.white)),
                  ElevatedButton(
                    child: Row(
                      children: [
                        Text("Try again ",style: TextStyle(fontFamily: 'Audiowide',fontSize: 26),),
                        Icon(Icons.replay,size: 26,),
                      ],
                    ),
                    onPressed: (){
                      game.reset();
                      game.overlays.remove('GameOver');
                      game.resumeEngine();
                      print('start game again');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}