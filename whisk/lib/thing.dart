class Thing {
  Thing(this._sprite)
      : _hotspot = new HotSpot(0,0,0,0),
        _onClick = new DoNothing();

  void Update(num timestep) {
    _sprite.Update(timestep);
  }

  void Draw(CanvasRenderingContext2D context) {
    // TODO: pass through the timestep to allow animated sprites to be locked to
    // a particular frame-rate.
    _sprite.Draw(context);
  }

  bool _is_hit(int x, int y) => _hotspot !== null && _hotspot.is_hit(x, y);

  int get _x() => _sprite._x;
  void set _x(int x) {
    _sprite._x = x;
    _hotspot._x = x;
  }

  int get _y() => _sprite._y;
  void set _y(int y) {
    _sprite._y = y;
    _hotspot._y = y;
  }

  Sprite _sprite;
  HotSpot _hotspot;
  Behaviour _onClick;
}
