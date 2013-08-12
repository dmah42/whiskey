part of whiskey;

class Scene {
  Scene(this._width, this._height)
      : _pages = new List<Page>(),
        _current_page = 0 {
    _createCanvas();
  }

  Scene._fromJSON(Map<String, dynamic> json)
      : _width = json['width'],
        _height = json['height'],
        _pages = new List<Page>(),
        _current_page = json['current_page'] {
    json['pages'].forEach((p) => _add(new Page._fromJSON(p)));
    _createCanvas();
  }

  void _createCanvas() {
    CanvasElement canvas = new CanvasElement(width: _width, height: _height);
    // TODO: set this outside the library.
    canvas.style
        ..position = "absolute"
        ..left = "50px"
        ..top = "50px";
    _context = canvas.getContext('2d');
    // TODO: touch events
    canvas.onClick.listen((e) => _onClick(e as MouseEvent));
    canvas.onMouseMove.listen((e) => _application.onMouseMove(e as MouseEvent));
    document.onKeyDown.listen((e) => _onKeyDown(e as KeyboardEvent));
    document.body.nodes.add(canvas);
  }

  void _add(Page page) => _pages.add(page);

  void _incPage() {
    if (_current_page < _pages.length - 1)
      ++_current_page;
    print('now on page $_current_page');
  }

  void _decPage() {
    if (_current_page > 0)
      --_current_page;
    print('now on page $_current_page');
  }

  void _frame(num timestep) {
    _pages[_current_page]._update(timestep);
    _context.clearRect(0, 0, _width, _height);
    _pages[_current_page]._draw(_context);
  }

  void _onClick(MouseEvent e) {
    print('click at ${e.client.x}, ${e.client.y}');
    if (_application.onClick(e) == false)
      _pages[_current_page]._onClick(e);
  }

  void _onKeyDown(KeyboardEvent e) {
    switch (e.keyCode) {
      case 0x25:  // Left
        _decPage();
        break;

      case 0x27:  // Right
        _incPage();
        break;
    }
  }

  Map<String, dynamic> _toJSON() {
    var attributes = new Map<String, dynamic>();
    attributes['width'] = _width;
    attributes['height'] = _height;
    attributes['current_page'] = _current_page;
    attributes['pages'] = _pages.map((p) => p._toJSON());
    return attributes;
  }

  CanvasRenderingContext2D _context;
  int _width;
  int _height;
  List<Page> _pages;
  int _current_page;
}
