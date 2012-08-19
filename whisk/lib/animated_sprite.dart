class AnimatedSprite extends Sprite {
  AnimatedSprite(String filename, int x, int y,
    this._frameWidth, this._frameHeight, this.loop)
      : super(filename, x, y),
        _column = 0,
        _row = 0,
        _frameIndex = 0;

  void _OnImageLoaded(ImageElement e) {
    print('AnimatedSprite.loaded ${e.src}');
    _sheetWidth = e.width;
    _sheetHeight = e.height;
    e.width = _frameWidth;
    e.height = _frameHeight;
    _numFrames = (_sheetWidth ~/ _frameWidth) * (_sheetHeight ~/ _frameHeight);
    super._OnImageLoaded(e);
  }

  void Update(num timestep) {
    if (!_loaded) return;

    ++_frameIndex;
    _column += _image.width;

    if (_frameIndex >= _numFrames) {
      // We're at the end. Loop if necessary.
      if (loop) {
        _column = _row = _frameIndex = 0;
      }
    } else if (_column + _image.width > _sheetWidth) {
      // End of row, drop down one.
      _column = 0;
      _row += _image.height;
    }
  }

  void Draw(CanvasRenderingContext2D ctx) {
    if (!_loaded) return;
    ctx.drawImage(_image, _column, _row, _image.width, _image.height,
                  _x, _y, _image.width, _image.height);
  }

  int _frameWidth;
  int _frameHeight;
  int _sheetWidth;
  int _sheetHeight;
  bool loop;
  int _column;
  int _row;
  int _frameIndex;
  int _numFrames;
}
