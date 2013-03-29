part of whiskey;

class Sequence extends Behaviour {
  Sequence(this._sequence, this._delay) : _runIndex = 0, _is_running = false;
  Sequence._fromJSON(Map<String, dynamic> json)
      : _runIndex = 0, _is_running = false, _delay = json['delay'] {
    _sequence = json['sequence'].map((e) => new Behaviour._fromJSON(e));
  }

  void _run(Thing thing) {
    if (_is_running)
      return;

    _thing = thing;
    _runIndex = 0;
    _is_running = true;
    _runOne();
  }

  void _runOne() {
    if (_runIndex == _sequence.length) {
      _is_running = false;
      return;
    }
    _sequence[_runIndex++]._run(_thing);
    window.setTimeout(_runOne, _delay);
  }

  Map<String, dynamic> _toJSON() {
    print('$this');
    Map<String, dynamic> attributes = super._toJSON();
    attributes['sequence'] = _sequence.map((e) => e._toJSON());
    attributes['delay'] = _delay;
    return attributes;
  }

  // TODO: first class type
  String get _type => 'sequence';

  List<Behaviour> _sequence;
  num _delay;

  int _runIndex;
  bool _is_running;
  Thing _thing;
}

