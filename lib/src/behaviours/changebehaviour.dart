part of whiskey;

class ChangeBehaviour extends Behaviour {
  ChangeBehaviour(this._behaviour);
  ChangeBehaviour._fromJSON(Map<String, dynamic> json)
      : this(json['behaviour']);

  void _run(Thing thing) {
    thing._onClick = _behaviour;
  }

  Map<String, dynamic> _toJSON() {
    print('$this');
    Map<String, dynamic> attributes = super._toJSON();
    attributes['behaviour'] = _behaviour._toJSON();
    return attributes;
  }

  // TODO: first class type
  String get _type => 'changebehaviour';

  Behaviour _behaviour;
}

