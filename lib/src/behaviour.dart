part of whiskey;

abstract class Behaviour {
  Behaviour();

  factory Behaviour._fromJSON(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'changebehaviour': return new ChangeBehaviour._fromJSON(json);
      case 'movethingby': return new MoveThingBy._fromJSON(json);
      case 'movethingto': return new MoveThingTo._fromJSON(json);
      case 'sequence': return new Sequence._fromJSON(json);
    }
    assert(false);
  }

  void _run(Thing thing);
  String get _type;
  Map<String, dynamic> _toJSON() {
    Map<String, dynamic> attributes = new Map();
    attributes['type'] = _type; // TODO: first class types. this.type.toString();
    return attributes;
  }
}
