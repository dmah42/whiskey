class Sprite {
  Sprite(String filename, this._x, this._y)
      : _image = new ImageElement(filename),
        _loaded = false {
    _image.on.load.add((e) => _OnImageLoaded(e.target as ImageElement));
  }

  void _OnImageLoaded(ImageElement e) {
    assert(!_loaded);
    print('Sprite.loaded ${e.src}');
    _loaded = true;
  }

  void Update(num timestep) {}

  void Draw(CanvasRenderingContext2D ctx) {
    if (!_loaded) return;
    ctx.drawImage(_image, _x, _y);
  }

  int _x;
  int _y;
  ImageElement _image;
  bool _loaded;
}
