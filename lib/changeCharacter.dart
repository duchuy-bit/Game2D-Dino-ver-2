
import 'package:flutter/material.dart';

import 'myGame.dart';

class ChangeCharacter extends StatelessWidget {

  final Game2DScreen game;

  const ChangeCharacter({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery. of(context). size. height,
        width: MediaQuery. of(context). size. width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(
              // horizontal: 500,
              // vertical: 500,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: 150,
                            height:100,
                            child: ElevatedButton(
                              onPressed: (){
                                game.mainCharacter..animation=game.walkMainDinoRed;
                                game.life.value=5;
                                game.overlays.remove('ChangeCharacter');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/changeDinoRed.png',
                                    width: 60,height: 60,fit: BoxFit.cover,),

                                  Spacer(),
                                  
                                  Icon(Icons.favorite , color: Colors.red,size: 40),
                                  Text("x5"),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: 150,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: (){
                                game.mainCharacter..animation=game.walkMainDinoBlue;
                                game.life.value=5;
                                game.overlays.remove('ChangeCharacter');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/changeDinoBlue.png',
                                    width: 60,height: 60,fit: BoxFit.cover,),

                                  Spacer(),
                                  
                                  Icon(Icons.favorite , color: Colors.red,size: 40),
                                  Text("x5"),
                                ],
                              ),
                            ),
                          ),
                        ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: 150,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: (){
                                game.mainCharacter..animation=game.walkMainWhite;
                                game.life.value=6;
                                game.overlays.remove('ChangeCharacter');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/changeWhite.png',
                                    width: 60,height: 60,fit: BoxFit.cover,),

                                  Spacer(),
                                  
                                  Icon(Icons.favorite , color: Colors.red,size: 40),
                                  Text("x6"),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: 150,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: (){
                                game.mainCharacter..animation=game.walkMainPink;
                                game.life.value=7;
                                game.overlays.remove('ChangeCharacter');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/changePink.png',
                                    width: 60,height: 60,fit: BoxFit.cover,),

                                  Spacer(),
                                  
                                  Icon(Icons.favorite , color: Colors.red,size: 40),
                                  Text("x7"),
                                ],
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}