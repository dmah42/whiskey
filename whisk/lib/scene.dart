class Scene {
  Scene(this._width, this._height)
      : _things = new List<Thing>() {
    _createCanvas();
  }

  Scene._fromJSON(Map<String, Dynamic> json)
      : _width = json['width'],
        _height = json['height'],
        _things = new List<Thing>() {
    json['things'].forEach((t) => _add(new Thing._fromJSON(t)));
    _createCanvas();
  }

  void _createCanvas() {
    CanvasElement canvas = new CanvasElement(_width, _height);
    _context = canvas.getContext('2d');
    // TODO: touch events
    canvas.on.click.add((e) => _onClick(e as MouseEvent));
  }

  void _add(Thing thing) => _things.add(thing);

  void _frame(num timestep) {
    _things.forEach((e) => e._update(timestep));
    
    // Sort sprites by 'y' so the draw in the correct order.
    // This should really be based on 'z'
    _things.sort((a, b) => a._sprite._y - b._sprite._y);

    _context.clearRect(0, 0, _width, _height);
    _things.forEach((e) => e._draw(_context));
  }

  void _onClick(MouseEvent e) {
    print('click at ${e.clientX}, ${e.clientY}');
    _things.forEach((thing) {
      if (thing._is_hit(e.clientX, e.clientY)) {
        thing._onClick._run(thing);
      }
    });
  }

  Map<String, Dynamic> _toJSON() {
    Map<String, Dynamic> attributes = new Map();
    attributes['width'] = _width;
    attributes['height'] = _height;
    attributes['things'] = _things.map((e) => e._toJSON());
    return attributes;
  }

  void _fromJSON(Map<String, Dynamic> json) {
    assert(false); // todo
  }

  CanvasRenderingContext2D _context;
  int _width;
  int _height;
  List<Thing> _things;
}
