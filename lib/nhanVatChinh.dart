import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

const double GRAVITY=1300;

class NhanVatChinh extends SpriteAnimationComponent with CollisionCallbacks{
  NhanVatChinh(): super (){
    debugMode: true;
  }
  double speedY=0.0;
  double yMax=0.0;

  @override
  Future<void> onLoad() async{
    super.onLoad();

    PolygonComponent polygonComponent= PolygonComponent([
      Vector2(this.x, this.y),
      Vector2(this.x, this.y+this.height),
      Vector2(this.x+this.width,this.y),
      Vector2(this.x+this.width,this.y+this.width),
    ]);
    add(polygonComponent);

    this.yMax=this.y;
    print(this.y);
  }

  bool isOnGround(){
    return (this.y >= this.yMax);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    //v = u + a*t;
    this.speedY +=GRAVITY * dt;

    //d = s0 + s*t;
    this.y += this.speedY * dt;

    if(isOnGround()){
      this.y=this.yMax;
      this.speedY=0.0;
    }
  }

  void jump(){
    if(isOnGround()){
      this.speedY= -600;
    }
  }
}