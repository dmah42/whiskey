import 'dart:html';
import 'lib/whiskey.dart' as whiskey;

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

void main() {
  HttpRequest.getString('data/scene.json').then((response) {
      print('Received $response');
      whiskey.loadScene(response);
      print('Starting whiskey');
      whiskey.run();
  });
}
