#import('dart:html');
#import('lib/whisk.dart', prefix: 'whisk');

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

void main() {
  final CanvasElement canvas = new CanvasElement(SCREEN_WIDTH, SCREEN_HEIGHT);
  document.body.nodes.add(canvas);

  String sceneJSON = whisk.createTestSceneJSON(canvas);
  print('--- JSON begin ---');
  print(sceneJSON);
  print('--- JSON end   ---');

  whisk.loadScene(canvas, sceneJSON);
  print('Starting whisk');
  whisk.run();
}
