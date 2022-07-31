import 'dart:async';


import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'myGame.dart';
class AttackButton extends StatelessWidget {
  final Game2DScreen game;
  AttackButton({ Key? key,required this.game }) : super(key: key);
  // Timer? timer;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: 650,
        top:250,
        ),
      child: 
      GestureDetector(
        onTap: (){        
          
          if(game.checkUltimate.value ==true ) {
            game.countUltimate=0;
            FlameAudio.audioCache.play("attack.mp3");
            game.attack.x = game.mainCharacter.x;
            game.checkAttack=true;
          }       
        },
        child: ValueListenableBuilder(
          valueListenable: game.checkUltimate,
          builder: (context,bool value, child) {
            return (value == true)? 
            ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.1),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9),
                          BlendMode.dstATop),
                    image: AssetImage('assets/images/attackFire.png',
                    ),
                    fit: BoxFit.cover, 
                    // opacity: Opacity(opacity: ,)
                    // : Colors.black.withOpacity(ChangeOpacity(true)),
                  ),
                ),
                child: Text(''),
                ),
              ),
            )
            :
            ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.1),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1),
                          BlendMode.dstATop),
                    image: AssetImage('assets/images/attackFire.png',
                    ),
                    fit: BoxFit.cover, 
                    // opacity: Opacity(opacity: ,)
                    // : Colors.black.withOpacity(ChangeOpacity(true)),
                  ),
                ),
                child: Text(''),
                ),
              ),
            );

          },
        ),
        
        ),
      );
    // );
    Padding(
      padding:  EdgeInsets.only(
        left: MediaQuery. of(context). size. width /9,
        top:MediaQuery. of(context). size. height /9,
        ),
      child: ElevatedButton(child: Text('alo'),
      onPressed: (){
        game.attack.x=game.mainCharacter.x;
        game.checkAttack=true;
      },)
    );
  }
}
// // class AttackButton extends StatefulWidget {
// //   final Game2DScreen game;
// //   const AttackButton({ Key? key, required this.game }) : super(key: key);

// //   @override
// //   State<AttackButton> createState() => _AttackButtonState();
// // }

// // class _AttackButtonState extends State<AttackButton> {

// //   int secondCountDown = 0;
// //   Timer? timer;
// //   bool checkTimer=false;

// //   void startTimer(){
// //     timer= Timer.periodic(Duration(seconds: 1), (_) { 
// //       setState(() {
// //         if(secondCountDown>0){
// //           secondCountDown --;
// //           print(secondCountDown);
// //         }else
// //         {
// //           if(secondCountDown==0){
// //           timer?.cancel();
// //         }
// //         }        
// //       });
// //     }    
// //     );
    
// //   }


// //   double ChangeOpacity(int seconds){
// //     if(seconds!=0)
// //     {
// //       return 0.1;
// //     }
// //     else {
// //       return 0.9;
// //     }
// //   }
// //   late Game2DScreen game;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     game=Game2DScreen();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding:  EdgeInsets.only(
// //         left: MediaQuery. of(context). size. width /9,
// //         top:MediaQuery. of(context). size. height /9,
// //         ),
// //       child: 
// //       GestureDetector(
// //         onTap: (){
// //           if(secondCountDown == 0)
// //           {
// //             // game.fire();
// //             // game.pressAttack();
// //             // game.PressAttack=true;
// //             // game.attack.x=game.mainCharacter.x;
// //             // game.checkAttack=true;
// //             setState(() {
// //               secondCountDown=5;
// //             });
// //             startTimer();
// //           }
          
          
// //         },
// //         child: ClipRRect(
// //           borderRadius: BorderRadius.circular(50),
// //           child: Container(
// //             height: 70,
// //             width: 70,
// //             decoration: BoxDecoration(
// //               color: Colors.black.withOpacity(0.5),
// //             ),
// //             child: Container(
// //               height: 85,
// //               width: 85,
// //               decoration: BoxDecoration(
// //                 // color: Colors.black.withOpacity(0.1),
// //                 image: DecorationImage(
// //                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(ChangeOpacity(secondCountDown)),
// //                         BlendMode.dstATop),
// //                   image: AssetImage('assets/images/attackFire.png',
// //                   ),
// //                   fit: BoxFit.cover, 
// //                   // opacity: Opacity(opacity: ,)
// //                   // : Colors.black.withOpacity(ChangeOpacity(true)),
// //                 ),
// //               ),
// //               child: Center(
// //                 child: Text("$secondCountDown",
// //                 style: TextStyle(
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 40,
// //                       ),
// //                   ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildTimer(){
// //     return Text(
// //       '$secondCountDown',
// //     );
// //   }
// // }

// class AttackButton extends StatelessWidget {

//   final Game2DScreen game;

//   AttackButton({Key? key, required this.game}) : super(key: key);

//   int secondCountDown = 0;
//   Timer? timer;

  
//   void startTimer(){
//     timer= Timer.periodic(Duration(seconds: 1), (_) { 
//         if(secondCountDown>0){
//           secondCountDown --;
//           print(secondCountDown);
//         }else
//         {
//           if(secondCountDown==0){
//           timer?.cancel();
//         }
//         }        
//       });
//     }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }        
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.only(
//         left: MediaQuery. of(context). size. width /9,
//         top:MediaQuery. of(context). size. height /9,
//         ),
//       child: 
//       GestureDetector(
//         onTap: (){
//           // if(secondCountDown == 0)
//           // {
//           //   // game.fire();
//           //   // game.pressAttack();
//           //   // game.PressAttack=true;
//           //   // game.attack.x=game.mainCharacter.x;
//           //   // game.checkAttack=true;
//           //   // setState(() {
//           //   //   secondCountDown=5;
//           //   // });
//           //   // startTimer();
//           // }
          
          
//         },
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(50),
//           child: Container(
//             height: 70,
//             width: 70,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.5),
//             ),
//             child: Container(
//               height: 85,
//               width: 85,
//               decoration: BoxDecoration(
//                 // color: Colors.black.withOpacity(0.1),
//                 image: DecorationImage(
//                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
//                         BlendMode.dstATop),
//                   image: AssetImage('assets/images/attackFire.png',
//                   ),
//                   fit: BoxFit.cover, 
//                   // opacity: Opacity(opacity: ,)
//                   // : Colors.black.withOpacity(ChangeOpacity(true)),
//                 ),
//               ),
//               child: Center(
//                 child: Text("alo",
//                 style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 40,
//                       ),
//                   ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }