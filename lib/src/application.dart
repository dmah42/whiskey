part of whiskey;

class Application {
  bool onClick(MouseEvent e) => false;
  bool onMouseMove(MouseEvent e) => false;

  void preRenderCallback(CanvasRenderingContext2D context) { }
  void postRenderCallback(CanvasRenderingContext2D context) { }
}
