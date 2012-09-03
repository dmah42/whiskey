class ChangeBehaviour extends Behaviour {
  ChangeBehaviour(this._behaviour);
  ChangeBehaviour._fromJSON(Map<String, Dynamic> json)
      : this(json['behaviour']);

  void _run(Thing thing) {
    thing._onClick = _behaviour;
  }

  Map<String, Dynamic> _toJSON() {
    print('$this');
    Map<String, Dynamic> attributes = super._toJSON();
    attributes['behaviour'] = _behaviour._toJSON();
    return attributes;
  }

  // TODO: first class type
  String get _type() => 'changebehaviour';

  Behaviour _behaviour;
}

