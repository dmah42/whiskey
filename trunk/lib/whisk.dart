#library('whisk');

#import('dart:html');
#import('dart:json');

#source('animated_sprite.dart');
#source('behaviour.dart');
#source('behaviours/changebehaviour.dart');
#source('behaviours/movethingby.dart');
#source('behaviours/movethingto.dart');
#source('behaviours/sequence.dart');
#source('hotspot.dart');
#source('page.dart');
#source('scene.dart');
#source('sprite.dart');
#source('thing.dart');
#source('words.dart');

Scene _scene = null;

void loadScene(String json) {
  assert(_scene == null);
  Map<String, Dynamic> sceneJSON = JSON.parse(json);
  _scene = new Scene._fromJSON(sceneJSON);
}

String saveScene() => JSON.stringify(_scene._toJSON());

Scene scene() => _scene;

void run() {
  window.requestAnimationFrame(_frame);
}

void _createScene(int width, int height) {
  assert(_scene == null);
  _scene = new Scene(width, height);
}

void _frame(num timestep) {
  _scene._frame(timestep);
  window.requestAnimationFrame(_frame);
}

String createTestSceneJSON() {
  _createScene(800, 600);
  final robot_sheet = new Thing(new Sprite('data/robot2.png', 0, 0));
 
  final robot = new Thing(
      new AnimatedSprite('data/robot2.png', 50, 50, 200, 200, true));
  robot._hotspot = new HotSpot(
      robot._x, robot._y, robot._x + 200, robot._y + 200);
  robot._onClick = new Sequence(
      [new MoveThingBy(200, 0), new MoveThingBy(-200, 0)],
      200);

  var robot_page = new Page();
  robot_page._add(robot_sheet);
  robot_page._add(robot);

  var alien_page = new Page();
  alien_page._add(new Thing(new Sprite('data/alien.jpg', 60, 60)));
  alien_page._addWords(new Words(0, 0, 55, 'Hello World!', '14 px sans-serif'));

  _scene._add(robot_page);
  _scene._add(alien_page);

  String sceneJSON = saveScene();
  _scene = null;
  return sceneJSON;
}
