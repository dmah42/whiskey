class MoveThingBy extends Behaviour {
  MoveThingBy(this._x, this._y);
  void _run(Thing thing) {
    thing._x += _x;
    thing._y += _y;
  }

  Map<String, Dynamic> _toJSON() {
    Map<String, Dynamic> attributes = super._toJSON();
    attributes['x'] = _x;
    attributes['y'] = _y;
    return attributes;
  }

  String get _name() => 'movethingby';

  num _x, _y;
}

