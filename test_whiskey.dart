import 'dart:html';
import 'lib/whiskey.dart' as whiskey;

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

void precallback(CanvasRenderingContext2D context) {
  print('pre');
}

void postcallback(CanvasRenderingContext2D context) {
  print('post');
}

void main() {
  HttpRequest.getString('data/scene.json').then((response) {
      print('Received $response');
      whiskey.loadScene(response);
      print('Starting whiskey');
      whiskey.run(precallback: precallback, postcallback: postcallback);
  });
}
