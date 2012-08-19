#import('dart:html');
#import('dart:json');

#source('animated_sprite.dart');
#source('hotspot.dart');
#source('scene.dart');
#source('sprite.dart');
#source('thing.dart');

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

Scene _scene = null;

void _frame(num timestep) {
  _scene._frame(timestep);
  window.requestAnimationFrame(_frame);
}

void _OnCanvasClick(MouseEvent e) {
  print('click at ${e.clientX}, ${e.clientY}');
  _scene._things.forEach((thing) {
    if (thing.is_hit(e.clientX, e.clientY)) {
      thing._onClick(thing);
    }
  });
}

// TODO: behaviours
void _MoveThingRight(Thing thing) {
  thing._x += 200;
  thing._onClick = _MoveThingLeft;
}

void _MoveThingLeft(Thing thing) {
  thing._x -= 200;
  thing._onClick = _MoveThingRight;
}

void main() {
  final CanvasElement canvas = new CanvasElement(SCREEN_WIDTH, SCREEN_HEIGHT);
  document.body.nodes.add(canvas);
  // TODO: touch events
  canvas.on.click.add((e) => _OnCanvasClick(e as MouseEvent));
  _scene = new Scene(canvas.getContext('2d'));

  final robot_sheet = new Thing();
  robot_sheet._sprite = new Sprite('robot2.png', 0, 0);
 
  final robot = new Thing();
  robot._sprite = new AnimatedSprite('robot2.png', 50, 50, 200, 200, true);
  robot._hotspot = new HotSpot(robot._x, robot._y,
      robot._x + 200, robot._y + 200);
  robot._onClick = _MoveThingRight;
    
  _scene._add(robot_sheet);
  _scene._add(robot);

  print('--- JSON begin ---');
  // fails to stringify due to NULL entries in _scene._things.
  //print(JSON.stringify(_scene._things));
  //print(JSON.stringify(_scene._behaviours));
  print('--- JSON end   ---');

  print('Starting animations');
  window.requestAnimationFrame(_frame);
}
