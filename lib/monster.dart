import 'dart:math';

import 'package:flame/assets.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:game/nhanVatChinh.dart';

import 'myGame.dart';

class Monster extends SpriteAnimationComponent with HasGameRef<Game2DScreen>,CollisionCallbacks{
  late Random _random;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is ScreenHitbox) {
      //...
    } else if (other is NhanVatChinh) {
      gameRef.pauseEngine();
      // print('cham==================');
    }
  }

  SpriteAnimation ranDomMonster(SpriteAnimation animation1, SpriteAnimation animation2, SpriteAnimation animation3)
  {
    late SpriteAnimation animation;
    _random= new  Random();
      final randomNumber=_random.nextInt(3);
      print('ran dom $randomNumber');

      switch (randomNumber){
        case 0:
          animation=animation1;
          break;
        case 1:
          animation= animation2;
          break;
        case 2:
          animation= animation3;
          break;
      }
    return animation;
  }
}