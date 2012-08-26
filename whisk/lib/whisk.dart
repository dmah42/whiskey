#library('whisk');

#import('dart:html');
#import('dart:json');

#source('animated_sprite.dart');
#source('behaviour.dart');
#source('behaviours/donothing.dart');
#source('behaviours/movethingby.dart');
#source('behaviours/movethingto.dart');
#source('hotspot.dart');
#source('scene.dart');
#source('sprite.dart');
#source('thing.dart');

Scene _scene = null;

void loadScene(CanvasElement canvas, String json) {
  assert(_scene == null);
  _createScene(canvas);
  _scene._things = JSON.parse(json);
}

String saveScene() => JSON.stringify(_scene._things);

Scene scene() => _scene;

void run() {
  window.requestAnimationFrame(_frame);
}

void _createScene(CanvasElement canvas) {
  assert(_scene == null);
  _scene = new Scene(canvas.getContext('2d'), canvas.width, canvas.height);
  // TODO: touch events
  canvas.on.click.add((e) => _scene._onClick(e as MouseEvent));
}

void _frame(num timestep) {
  _scene._frame(timestep);
  window.requestAnimationFrame(_frame);
}

String createTestSceneJSON(CanvasElement canvas) {
  _createScene(canvas);
  final robot_sheet = new Thing(new Sprite('data/robot2.png', 0, 0));
 
  final robot = new Thing(
      new AnimatedSprite('data/robot2.png', 50, 50, 200, 200, true));
  robot._hotspot = new HotSpot(
      robot._x, robot._y, robot._x + 200, robot._y + 200);
  robot._onClick = new MoveThingBy(200, 0);

  _scene._add(robot_sheet);
  _scene._add(robot);

  String sceneJSON = saveScene();
  _scene = null;
  return sceneJSON;
}
