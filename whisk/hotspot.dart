class HotSpot {
  HotSpot(this._x, this._y, this._w, this._h);

  bool is_hit(num x, num y) => x > _x && x < _x + _w && y > _y && y < _y + _h;

  num _x;
  num _y;
  num _w;
  num _h;
}
