part of whiskey;

class AnimatedSprite extends Sprite {
  AnimatedSprite(String filename, int x, int y,
    this._frameWidth, this._frameHeight, this._loop)
      : super(filename, x, y),
        _column = 0,
        _row = 0,
        _frameIndex = 0;

  void _onImageLoaded(ImageElement e) {
    print('AnimatedSprite.loaded ${e.src}');
    _sheetWidth = e.width;
    _sheetHeight = e.height;
    e.width = _frameWidth;
    e.height = _frameHeight;
    _numFrames = (_sheetWidth ~/ _frameWidth) * (_sheetHeight ~/ _frameHeight);
    super._onImageLoaded(e);
  }

  void _update(num timestep) {
    if (!_loaded) return;

    ++_frameIndex;
    _column += _image.width;

    if (_frameIndex >= _numFrames) {
      // We're at the end. Loop if necessary.
      if (_loop) {
        _column = _row = _frameIndex = 0;
      }
    } else if (_column + _image.width > _sheetWidth) {
      // End of row, drop down one.
      _column = 0;
      _row += _image.height;
    }
  }

  void _draw(CanvasRenderingContext2D ctx) {
    if (!_loaded) return;
    ctx.drawImageScaledFromSource(_image, _column, _row,
                                  _image.width, _image.height,
                                  _scene._scaleWidth(_x),
                                  _scene._scaleHeight(_y),
                                  _scene._scaleWidth(_image.width),
                                  _scene._scaleHeight(_image.height));
  }

  Map<String, dynamic> _toJSON() {
    Map<String, dynamic> attributes = super._toJSON();
    attributes['framewidth'] = _frameWidth;
    attributes['frameheight'] = _frameWidth;
    attributes['loop'] = _loop;
    attributes['type'] = 'animated_sprite';
    return attributes;
  }

  int _frameWidth;
  int _frameHeight;
  int _sheetWidth;
  int _sheetHeight;
  bool _loop;
  int _column;
  int _row;
  int _frameIndex;
  int _numFrames;
}
