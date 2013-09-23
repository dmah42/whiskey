part of whiskey;

class Words {
  Words(this._x, this._y, this._w, this._text, this._font);
  Words._fromJSON(Map<String, dynamic> json)
      : _x = json['x'],
        _y = json['y'],
        _w = json['w'],
        _text = json['text'],
        _font = json['font'],
        _color = json['color'];

  void _draw(CanvasRenderingContext2D context) {
    var fill = context.fillStyle;
    context.font = _font;
    context.fillStyle = _color;
    if (_w != null) {
      context.fillText(_text, _scene._scaleWidth(_x), _scene._scaleHeight(_y),
                       _scene._scaleWidth(_w));
    } else {
      context.fillText(_text, _scene._scaleWidth(_x), _scene._scaleHeight(_y));
    }
    context.fillStyle = fill;
  }

  Map<String, dynamic> _toJSON() {
    var attributes = new Map<String, dynamic>();
    attributes['x'] = _x;
    attributes['y'] = _y;
    attributes['w'] = _w;
    attributes['text'] = _text;
    attributes['font'] = _font;
    attributes['color'] = _color;
    return attributes;
  }

  num _x;
  num _y;
  num _w;
  String _text;
  String _font;
  String _color;
}
