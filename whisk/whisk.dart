#import('dart:html');
#import('lib/whisk.dart', prefix: 'whisk');

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

void main() {
  // TODO: httprequest for data/scene.json
  whisk.loadScene('');
  print('Starting whisk');
  whisk.run();
}
