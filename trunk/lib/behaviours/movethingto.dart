class MoveThingTo extends Behaviour {
  MoveThingTo(this._x, this._y);
  MoveThingTo._fromJSON(Map<String, Dynamic> json) : this(json['x'], json['y']);

  void _run(Thing thing) {
    thing._x = _x;
    thing._y = _y;
  }

  Map<String, Dynamic> _toJSON() {
    print('$this');
    Map<String, Dynamic> attributes = super._toJSON();
    attributes['x'] = _x;
    attributes['y'] = _y;
    return attributes;
  }

  // TODO: first class type
  String get _type() => 'movethingto';

  num _x, _y;
}

