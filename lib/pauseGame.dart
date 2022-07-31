
import 'package:flutter/material.dart';

import 'myGame.dart';

class PauseGameButton extends StatelessWidget {

  final Game2DScreen game;

  const PauseGameButton({Key? key, required this.game}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(onPressed: (){
            game.pauseEngine();
            print('pause game');
            game.overlays.add('ResumeGame');
            // game.addResume();
            // overlay
            // ResumeGameButton(game: game);
          }, icon: Icon(Icons.pause,color: Colors.white,size: 40,)),

          //tao khoang cach ơ giua
          Spacer(),

          //-----HEALTHY------
          ValueListenableBuilder(
              valueListenable: game.life,
              builder: (context,int value, child){
                return Row(
                  children: [
                    (0 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                    (1 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                    (2 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                    (3 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                    (4 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                    (5 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                    (6 < value )? Icon( Icons.favorite , color: Colors.red,size: 40): Text(''),
                  ],
                );
              }
          ),
        ],
      ),
    );
  }
}

class ResumeGameButton extends StatelessWidget {

  final Game2DScreen game;

  const ResumeGameButton({Key? key, required this.game}) : super(key: key);

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
              // IconButton(onPressed: (){
              //   game.pauseEngine();
              //   print('pause game');
              // }, icon: Icon(Icons.pause)),


              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text('Paused Game',
                      style: TextStyle(fontFamily: 'Audiowide',fontSize: 30,color: Colors.white)),

                  ElevatedButton(
                    onPressed: (){
                        game.overlays.remove('ResumeGame');
                        game.resumeEngine();
                        print('start game');
                    },
                    child: Text("Resume Game",
                      style: TextStyle(fontFamily: 'Audiowide',color: Colors.white,fontSize: 25),),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      game.overlays.remove('Resume Game');
                      // game.checkMusicBackground.value=!(game.checkMusicBackground.value);                      
                      game.overlays.add('StartGame');
                      game.reset();
                    },
                    child: Text(" Menu Game ",
                      style: TextStyle(fontFamily: 'Audiowide',color: Colors.white,fontSize: 25),),
                  ),

                  Row(
                    children: [
                      Text('Music    ',
                          style: TextStyle(fontFamily: 'Audiowide',fontSize: 30,color: Colors.white)),
                      ElevatedButton(
                          onPressed: (){
                            game.turnOnOffMusicBackground();
                          },
                          child: ValueListenableBuilder(
                              valueListenable: game.checkMusicBackground,
                              builder: (context,bool value, child){
                                return Icon((value==true )? Icons.music_video_outlined : Icons.music_off);
                              }
                          )
                      ),
                    ],
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