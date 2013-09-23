part of whiskey;

class HotSpot {
  HotSpot(this._x, this._y, this._w, this._h);
  HotSpot._fromJSON(Map<String, dynamic> json)
      : this(json['x'], json['y'], json['w'], json['h']);

  bool _is_hit(num x, num y) {
    return x > _scene._scaleWidth(_x) && x < _scene._scaleWidth(_x + _w) &&
           y > _scene._scaleHeight(_y) && y < _scene._scaleHeight(_y + _h);
  }

  Map<String, dynamic> _toJSON() {
    Map<String, dynamic> attributes = new Map();
    attributes['x'] = _x;
    attributes['y'] = _y;
    attributes['w'] = _w;
    attributes['h'] = _h;
    return attributes;
  }

  num _x;
  num _y;
  num _w;
  num _h;
}
