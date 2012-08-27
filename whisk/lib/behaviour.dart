class Behaviour {
  Behaviour() { }

  factory Behaviour._fromJSON(Map<String, Dynamic> json) {
    switch (json['type']) {
      case 'changebehaviour': return new ChangeBehaviour._fromJSON(json);
      case 'movethingby': return new MoveThingBy._fromJSON(json);
      case 'movethingto': return new MoveThingTo._fromJSON(json);
      case 'sequence': return new Sequence._fromJSON(json);
    }
    assert(false);
  }

  abstract void _run(Thing thing);
  abstract String get _type();
  Map<String, Dynamic> _toJSON() {
    Map<String, Dynamic> attributes = new Map();
    attributes['type'] = _type; // TODO: first class types. this.type.toString();
    return attributes;
  }
}
