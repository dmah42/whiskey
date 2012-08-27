#import('dart:html');
#import('lib/whisk.dart', prefix: 'whisk');

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

void main() {
  new XMLHttpRequest.get('data/scene.json', onSuccess);
}

void onSuccess(XMLHttpRequest req) {
  if (req.readyState == XMLHttpRequest.DONE) {
    print('Received ${req.response}');
    whisk.loadScene(req.response as String);
    print('Starting whisk');
    whisk.run();
  }
}
