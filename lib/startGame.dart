
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

import 'myGame.dart';

class StartGame extends StatelessWidget {

  final Game2DScreen game;

  const StartGame({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(        
        height: MediaQuery. of(context). size. height ,
        width: MediaQuery. of(context). size. width ,
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('My Game',style: TextStyle(fontFamily: 'Audiowide',fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),

                    ElevatedButton(
                      onPressed: (){
                        game.overlays.remove('StartGame');
                        game.overlays.remove('ResumeGame');
                        //pause game
                        game.overlays.add('PauGame');
                        game.resumeEngine();
                        },
                      child: Text("Play Game",
                        style: TextStyle(fontFamily: 'Audiowide',color: Colors.white,fontSize: 25),),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        game.overlays.add('ChangeCharacter');
                      },
                      child: Text("Change Character",
                        style: TextStyle(fontFamily: 'Audiowide',color: Colors.white,fontSize: 25),),
                    ),
                    // ElevatedButton(
                    //   onPressed: (){
                    //     // game.overlays.remove('StartGame');
                    //     // //pause game
                    //     // game.overlays.add('SettingAudio');
                    //     // game.resumeEngine();
                    //   },
                      // child: Text("Top 3 Ranking",
                      //   style: TextStyle(fontFamily: 'Audiowide',color: Colors.white,fontSize: 25),),
                    // )
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}