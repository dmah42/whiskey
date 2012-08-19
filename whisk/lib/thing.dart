
typedef void OnClickHandler(Thing thing);

class Thing {
  Thing() : _sprite = null, _hotspot = null;

  void Update(num timestep) {
    _sprite.Update(timestep);
  }

  void Draw(CanvasRenderingContext2D context) {
    // TODO: pass through the timestep to allow animated sprites to be locked to
    // a particular frame-rate.
    _sprite.Draw(context);
  }

  bool is_hit(int x, int y) => _hotspot !== null && _hotspot.is_hit(x, y);

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
  OnClickHandler _onClick;
}
