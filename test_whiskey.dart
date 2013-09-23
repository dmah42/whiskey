import 'dart:html';
import 'lib/whiskey.dart' as whiskey;

final SCREEN_WIDTH = 800;
final SCREEN_HEIGHT = 600;

class TestWhiskey extends whiskey.Application {
  void preRenderCallback(CanvasRenderingContext2D context) => print('pre');
  void postRenderCallback(CanvasRenderingContext2D context) => print('post');
}

void main() {
  HttpRequest.getString('data/scene.json').then((response) {
      print('Received $response');
      whiskey.setApplication(new TestWhiskey());
      whiskey.loadScene(SCREEN_WIDTH, SCREEN_HEIGHT, response);
      print('Starting whiskey');
      whiskey.run();
  });
}
