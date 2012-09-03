class Page {
  Page() : _things = new List<Thing>();

  Page._fromJSON(Map<String, Dynamic> json)
      : _things = new List<Thing>() {
    json['things'].forEach((t) => _add(new Thing._fromJSON(t)));
  }

  void _add(Thing thing) => _things.add(thing);

  void _update(num timestep) {
    _things.forEach((e) => e._update(timestep));
  }
  
  void _draw(CanvasRenderingContext2D context) {
    // Sort sprites by 'y' so the draw in the correct order.
    // This should really be based on 'z'
    _things.sort((a, b) => a._sprite._y - b._sprite._y);
    _things.forEach((e) => e._draw(context));
  }

  void _onClick(MouseEvent e) {
    _things.forEach((thing) {
      if (thing._is_hit(e.clientX, e.clientY)) {
        thing._onClick._run(thing);
      }
    });
  }

  Map<String, Dynamic> _toJSON() {
    var attributes = new Map<String, Dynamic>();
    attributes['things'] = _things.map((e) => e._toJSON());
    return attributes;
  }

  List<Thing> _things;
}
