class MoveThingBy implements Behaviour {
  MoveThingBy(this._x, this._y);
  void _run(Thing thing) {
    thing._x += _x;
    thing._y += _y;
  }

  num _x, _y;
}
