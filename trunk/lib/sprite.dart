class Sprite {
  Sprite(String filename, this._x, this._y)
      : _image = new ImageElement(filename),
        _loaded = false {
    _image.on.load.add((e) => _onImageLoaded(e.target as ImageElement));
  }

  factory Sprite._fromJSON(Map<String, Dynamic> json) {
    switch (json['type']) {
      case 'sprite': return new Sprite(json['filename'], json['x'], json['y']);
      case 'animated_sprite':
        return new AnimatedSprite(json['filename'], json['x'], json['y'],
            json['framewidth'], json['frameheight'], json['loop']);
    }
    assert(false);
  }

  void _onImageLoaded(ImageElement e) {
    assert(!_loaded);
    print('Sprite.loaded ${e.src}');
    _loaded = true;
  }

  void _update(num timestep) {}

  void _draw(CanvasRenderingContext2D ctx) {
    if (!_loaded) return;
    ctx.drawImage(_image, _x, _y);
  }

  Map<String, Dynamic> _toJSON() {
    Map<String, Dynamic> attributes = new Map();
    attributes['x'] = _x;
    attributes['y'] = _y;
    attributes['filename'] = _image.src;
    attributes['type'] = 'sprite';
    return attributes;
  }

  int _x;
  int _y;
  ImageElement _image;
  bool _loaded;
}
