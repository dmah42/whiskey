class Scene {
  Scene(this._context)
      : _things = new List<Thing>();

  void _add(Thing thing) => _things.add(thing);

  void _frame(num timestep) {
    _things.forEach((e) => e.Update(timestep));
    
    // Sort sprites by 'y' so the draw in the correct order.
    // This should really be based on 'z'
    _things.sort((a, b) => a._sprite._y - b._sprite._y);

    _context.clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _things.forEach((e) => e.Draw(_context));
  }

  CanvasRenderingContext2D _context;
  List<Thing> _things;
}
