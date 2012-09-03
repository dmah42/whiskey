class Scene {
  Scene(this._width, this._height)
      : _pages = new List<Page>(),
        _currentPage = 0 {
    _createCanvas();
  }

  Scene._fromJSON(Map<String, Dynamic> json)
      : _width = json['width'],
        _height = json['height'],
        _pages = new List<Page>(),
        _currentPage = json['currentPage'] {
    json['pages'].forEach((p) => _add(new Page._fromJSON(p)));
    _createCanvas();
  }

  void _createCanvas() {
    CanvasElement canvas = new CanvasElement(_width, _height);
    _context = canvas.getContext('2d');
    // TODO: touch events
    canvas.on.click.add((e) => _onClick(e as MouseEvent));
    document.on.keyDown.add((e) => _onKeyDown(e as KeyboardEvent));
    document.body.nodes.add(canvas);
  }

  void _add(Page page) => _pages.add(page);

  void _incPage() {
    if (_currentPage < _pages.length - 1)
      ++_currentPage;
    print('now on page $_currentPage');
  }

  void _decPage() {
    if (_currentPage > 0)
      --_currentPage;
    print('now on page $_currentPage');
  }

  void _frame(num timestep) {
    _pages[_currentPage]._update(timestep);
    _context.clearRect(0, 0, _width, _height);
    _pages[_currentPage]._draw(_context);
  }

  void _onClick(MouseEvent e) {
    print('click at ${e.clientX}, ${e.clientY}');
    _pages[_currentPage]._onClick(e);
  }

  void _onKeyDown(KeyboardEvent e) {
    switch (e.keyIdentifier) {
      case "Left":
        _decPage();
        break;

      case "Right":
        _incPage();
        break;
    }
  }

  Map<String, Dynamic> _toJSON() {
    var attributes = new Map<String, Dynamic>();
    attributes['width'] = _width;
    attributes['height'] = _height;
    attributes['currentPage'] = _currentPage;
    attributes['pages'] = _pages.map((p) => p._toJSON());
    return attributes;
  }

  void _fromJSON(Map<String, Dynamic> json) {
    assert(false); // todo
  }

  CanvasRenderingContext2D _context;
  int _width;
  int _height;
  List<Page> _pages;
  int _currentPage;
}
