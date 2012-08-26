class HotSpot {
  HotSpot(this._x, this._y, this._w, this._h);

  bool is_hit(num x, num y) => x > _x && x < _x + _w && y > _y && y < _y + _h;

  Map<String, Dynamic> _toJSON() {
    Map<String, Dynamic> attributes = new Map();
    attributes['x'] = _x;
    attributes['x'] = _y;
    attributes['x'] = _w;
    attributes['x'] = _h;
    return attributes;
  }

  num _x;
  num _y;
  num _w;
  num _h;
}
