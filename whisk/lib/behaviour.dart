class Behaviour {
  abstract void _run(Thing thing);
  abstract String get _name();
  Map<String, Dynamic> _toJSON() {
    Map<String, Dynamic> attributes = new Map();
    attributes['name'] = _name;
    return attributes;
  }
}
