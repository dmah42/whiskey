part of whisk;

class MoveThingBy extends Behaviour {
  MoveThingBy(this._x, this._y);
  MoveThingBy._fromJSON(Map<String, dynamic> json) : this(json['x'], json['y']);

  void _run(Thing thing) {
    thing._x += _x;
    thing._y += _y;
  }

  Map<String, dynamic> _toJSON() {
    print('$this');
    Map<String, dynamic> attributes = super._toJSON();
    attributes['x'] = _x;
    attributes['y'] = _y;
    return attributes;
  }

  // TODO: first class type
  String get _type => 'movethingby';

  num _x, _y;
}

