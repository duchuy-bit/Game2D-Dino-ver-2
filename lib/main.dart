import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game/pauseGame.dart';
import 'package:game/startGame.dart';

import 'attackButton.dart';
import 'changeCharacter.dart';
import 'gameOver.dart';
import 'injured.dart';
import 'myGame.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'This is My Game 2D'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Game2DScreen game;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    game=Game2DScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        overlayBuilderMap: {
          //------WHEN START GAME-----
          'StartGame':(BuildContext context, Game2DScreen game)
          {
            return StartGame(game: game);
          },
          //------PAUSE GAME-----
          'PauGame':(BuildContext context, Game2DScreen game)
          {
            return PauseGameButton(game: game);
          },
          //--------RESUME GAME---------
          'ResumeGame':(BuildContext context, Game2DScreen game)
          {
            return ResumeGameButton(game: game);
          },
          // ----------HEALTHY-----------
          'GameOver':(BuildContext context, Game2DScreen game)
          {
            return GameOver(game: game);
          },
          // ----------BỊ THƯƠNG-----------
          'Injured':(BuildContext context, Game2DScreen game)
          {
            return Injured(game: game);
          },
          //-----------ChangeCharacter-----
          'ChangeCharacter':(BuildContext context, Game2DScreen game)
          {
            return ChangeCharacter(game: game);
          },
          //-----------Attack Button-----
          'AttackButton':(BuildContext context, Game2DScreen game)
          {
            return AttackButton(game: game);
          },
        },
      ),
    );
  }
}

