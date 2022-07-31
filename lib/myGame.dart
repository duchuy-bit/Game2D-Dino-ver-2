import 'dart:math';

import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'monster.dart';
import 'nhanVatChinh.dart';

class Game2DScreen extends FlameGame with TapDetector,HasCollisionDetection{

  double speed = 1.0;
  late ValueNotifier<int> life;
  late ValueNotifier<bool> checkUltimate;
  int countUltimate=0;
  // bool checkLoad=true;
  int test=5;
  bool hit=false,check=false;
  double vitriChuanY=0.0;
  bool checkSoundEffect=true;
  bool checkAttack=false;
  
    // checkMusic
  late ValueNotifier<bool> checkMusicBackground;


  //size screen
  double chieucao=0.0;
  double chieurong=0.0;

  //-- nhân vật chính
  late NhanVatChinh mainCharacter;
  late SpriteAnimation walkMainDinoRed;
  late SpriteAnimation walkMainDinoBlue;
  late SpriteAnimation walkMainWhite;
  late SpriteAnimation walkMainPink;

  //hiệu ứng tấn công
  late SpriteAnimationComponent attack;
  late SpriteAnimation attackAnimation;
  

  //-- quái vật
  late SpriteAnimation walk1;
  late SpriteAnimation walk2;
  late SpriteAnimation walk3;

  late Random _random;
  late Random _randomFly;

  int before=0;
  // late SpriteAnimationComponent MonsterThreeInOne;

  Monster CanhCut = Monster() ;
  Monster MonsterFly = Monster();
  Monster PigArmor = Monster();

  Monster MonsterThree = Monster();
  Monster MonsterThree2 = Monster();


  // late Monster canhCut;
  // late SpriteAnimationComponent CanhCut;

  //-- background
  late ParallaxComponent backgroundAnimation;

  //-- điểm đạt được
  int score=0;
  late TextComponent textScore;

  //  onload 
  //  update

  @override
  Future<void> onLoad() async {
    //  --- lấy chiều cao để đưa vào màn hình đỏ lúc bị thương
    chieucao=size.x+20;
    chieurong=size.y;

    //am thanh
    FlameAudio.bgm.initialize();

    checkMusicBackground = ValueNotifier(true);
    checkUltimate = ValueNotifier(true);

    // có 5 lần mắc lỗi
    life = ValueNotifier(5);

    // - thêm background cho game
    // - background phải được thêm trước nhân vật và chướng ngại vật
    //      vì thêm sau nó sẽ che mất những thứ trước đó
    backgroundAnimation= await ParallaxComponent.load([
      ParallaxImageData('backgroundAnimation/nen1.png',),
      ParallaxImageData('backgroundAnimation/nen2.png',),
      ParallaxImageData('backgroundAnimation/nen3.png',),
      ParallaxImageData('backgroundAnimation/nen4.png',),
      ParallaxImageData('backgroundAnimation/nen5.png',),
      ParallaxImageData('backgroundAnimation/tham_co.png'),
    ],
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(65, 0),
      velocityMultiplierDelta: Vector2(1.25, 0),
    );
    add(backgroundAnimation);

    // điểm số khi chơi
    textScore=TextComponent(
        text: score.toString(),
        textRenderer: TextPaint(style: TextStyle(fontFamily: 'Audiowide',
                  color: Colors.white,fontSize: 25))
        // textRenderer: TextBoxConfig()
    );
    textScore
      ..x = size.x/2  -  (textScore.width/2)
      ..y = textScore.height/2;
    add(textScore);

    //thêm nhân vật vào game
    //load animation của 4 nhan vat
    walkMainDinoBlue = SpriteAnimation.fromFrameData(
      await images.load('dinoBlue.png'),
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(24, 24)
      )
    );

    walkMainDinoRed = SpriteAnimation.fromFrameData(
      await images.load('dinoRed.png'),
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(24, 24)
      )
    );

    walkMainWhite = SpriteAnimation.fromFrameData(
      await images.load('mainAoTrang.png'),
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32)
      )
    );
    
    walkMainPink = SpriteAnimation.fromFrameData(
      await images.load('mainPink.png'),
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32)
      )
    );


  //them đối tượng nhân vật vào game
  //SpriteAnimationComponent
    mainCharacter= NhanVatChinh()
      ..animation = walkMainDinoRed
      ..size = Vector2(size.x/10-15, size.x/10-15)
      ..position = Vector2(size.x/10,  size.y - 25 - size.x/10);
    add(mainCharacter);

    //-------set vị trí chuẩn cho quái vật theo trục Y
    vitriChuanY= size.y - 32 - size.x/10;

    //hiệu ứng tấn công
    attackAnimation = SpriteAnimation.fromFrameData(
      await images.load('attack.png'),
      SpriteAnimationData.sequenced(
          amount: 30,
          stepTime: 0.02,
          textureSize: Vector2(32, 32)
      )
    );
    attack= SpriteAnimationComponent()
      ..animation = attackAnimation
      ..size=Vector2(size.x/5, size.x/5)
      ..position= Vector2(size.x+10, vitriChuanY-size.x/10);
    add(attack);

    //---------thêm quái vật vào game--------
    final spritesheet1=await fromJSONAtlas('canhcut.png', 'canhcut.json');//đọc file
    final spritesheet2=await fromJSONAtlas('monsterFly.png', 'monsterFly.json');//đọc file
    final spritesheet3=await fromJSONAtlas('pigArmor.png', 'pigArmor.json');//đọc file

    // SpriteAnimation
    walk1= SpriteAnimation.spriteList(spritesheet1, stepTime: 0.1);
    // SpriteAnimation
    walk2= SpriteAnimation.spriteList(spritesheet2, stepTime: 0.2);
    // SpriteAnimation
    walk3= SpriteAnimation.spriteList(spritesheet3, stepTime: 0.2);

    CanhCut
      ..animation = walk1
      ..size=Vector2(size.x/10, size.x/10)
      ..position= Vector2(size.x, vitriChuanY);

    MonsterFly
      ..animation = walk2
      ..size=Vector2(size.x/10, size.x/10)
      ..position= Vector2(size.x,vitriChuanY);

    PigArmor
      ..animation = walk3
      ..size=Vector2(size.x/10, size.x/10)
      ..position= Vector2(size.x, vitriChuanY );


    //quai vật thứ nhất có animation của con cánh cụt zang hồ
    MonsterThree = CanhCut;
    add(MonsterThree);

    //con quái vật thứ 2 cũng vậy
    //nhưng tọa độ x của nó là kích thước ngang màn hình * 3 / 2
    MonsterThree2
      ..animation = walk3
      ..size=Vector2(size.x/10, size.x/10)
      ..position= Vector2(size.x*3/2 +(size.x/20), vitriChuanY);
    add(MonsterThree2);

    // in kích thước màn hình
    print(size.toString());


    //------------

    // return super.onLoad();
    overlays.add('AttackButton');
    overlays.add('StartGame');
    // overlays.add('Ultimate');
    pauseEngine();
    FlameAudio.bgm.play('8Bit_Platformer_Loop.wav');

  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

  //int score
    score+=(60*dt).toInt();
    textScore.text=score.toString();


    //tốc độ
    speed= (score/200)+1;

    //------tăng tốc độ
    if(score % 200 == 0) {
      print('speed ${speed}');
    }

    if(checkAttack ){ print("checkAttack $checkAttack");  attack.x+=6; }  

    if(attack.x>=size.x) {  checkAttack=false; checkUltimate.value=false;  }

    if(checkAttack==true && attack.x + attack.width -10 >= MonsterThree.x ){
      MonsterThree.animation=null;
    }
    if(checkAttack==true && attack.x + attack.width -10 >= MonsterThree2.x ){
      MonsterThree2.animation=null;
    }

    if(countUltimate == 5){
      checkUltimate.value=true;
    }

    // --------Quái vật di chuyển sang trái
    MonsterThree.x -= (4 + speed);
    MonsterThree2.x -= (4 + speed);


    if(MonsterThree.x + MonsterThree.width<0) {
      if(MonsterThree.animation != null && countUltimate <= 4) countUltimate++;
      print("dem vuot quai $countUltimate");
      MonsterThree..animation= MonsterThree.ranDomMonster(walk1, walk2, walk3)
                  ..y = vitriChuanY;
      if(MonsterThree.animation == walk2)
      {
        _randomFly = Random();
          final randomFlyNumber =  _randomFly.nextBool();
          if(randomFlyNumber == true){
            //nếu bay được thì cho tọa độ y bé lại
            MonsterThree.y = vitriChuanY - mainCharacter.height -10 ;
          }
      }
      MonsterThree.x = size.x;
    }


    //tọa độ x cho quái vật thứ 2 khi di chuyển hết chặng đường từ phải sang trái
    if(MonsterThree2.x + MonsterThree2.width<0) {
      if(MonsterThree.animation!=null&&countUltimate<=4) countUltimate++;
      print("dem vuot quai $countUltimate");
      MonsterThree2..animation = MonsterThree2.ranDomMonster(walk1, walk2, walk3)
        ..y = vitriChuanY;
      if(MonsterThree2.animation == walk2)
      {
        _randomFly = Random();
          final randomFlyNumber =  _randomFly.nextBool();
          if(randomFlyNumber == true){
            //nếu bay được thì cho tọa độ y bé lại
            MonsterThree2.y =vitriChuanY - mainCharacter.height -10 ;
          }
      }
      MonsterThree2.x=size.x;
    }

    // va cham quai
    if((MonsterThree.animation!=null)&&(MonsterThree2.animation!=null)&&
    ((mainCharacter.distance(MonsterThree)<50)||(mainCharacter.distance(MonsterThree2)<50))
        && (check==false) )
    {
      check=true;
      hit=true;
      FlameAudio.audioCache.play("hurt7.wav");
      //--hiệu ứng màn hình đỏ khi nhân vật chạm vào quái
      overlays.add('Injured');
    }

    // restart
    if(hit){
      hit=false;
      test-=1;
      life.value-=1;
      print('life = $test');
    }

    //---xóa hiệu ứng màn hình đỏ khi chạm vào quái đi
    if((MonsterThree.x <= mainCharacter.x)||(MonsterThree2.x <= mainCharacter.x)){  
      // màn hình sẽ đỏ tới khi tọa độ x quái vật
      //đạt điều kiện
      overlays.remove('Injured');
    }

    if((MonsterThree.x <=0)||(MonsterThree2.x <=0)){
      check=false;
    }

    if(life.value == 0){
      //dung game
      pauseEngine();
      //nhac dung
      FlameAudio.bgm.stop();
      // them overlay Gameover
      overlays.add('GameOver');

    }

  }

  void turnOnOffMusicBackground(){
    checkMusicBackground.value=!checkMusicBackground.value;
    if(checkMusicBackground.value == true){
      FlameAudio.bgm.play('8Bit_Platformer_Loop.wav');
    }
    else{
      FlameAudio.bgm.stop();
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    super.onTapDown(info);
    //am thanh nhay
    FlameAudio.audioCache.play("jump14.wav");
    //goi phuong thuc nhay cua NhanVatChinh
    mainCharacter.jump();
  }

  void reset(){
    checkAttack=false;
    countUltimate=0;
    checkUltimate.value=false;
    check=false;
    hit=false;
    score=0;
    speed=0;
    attack.x=size.x+10;
    MonsterThree.x=size.x;
    MonsterThree2.x = size.x * 3 / 2;
    life.value=5;
    if(checkMusicBackground.value==true ) FlameAudio.bgm.play('8Bit_Platformer_Loop.wav');
    // turnOnOffMusicBackground();
    overlays.remove('Injured');
  }

  // khi người dùng mở đa nhiệm hoặc thoát ra ngoài màn hình chính
  @override
  void lifecycleStateChange(AppLifecycleState state) {
    // TODO: implement lifecycleStateChange
    super.lifecycleStateChange(state);
    switch (state){
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        pauseEngine();
        overlays.add('ResumeGame');
        break;
      case AppLifecycleState.paused:
        pauseEngine();
        overlays.add('ResumeGame');
        break;
      case AppLifecycleState.detached:
        pauseEngine();
        overlays.add('ResumeGame');
        break;
    }
  }

}