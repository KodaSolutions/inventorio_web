class BreakPoint {
  int _breakPoint = 0;
  final List<Function(int)> _observadores = [];

  int get valor => _breakPoint;

  void setValue(int breakpoint) {
    if (_breakPoint != breakpoint) {
      _breakPoint = breakpoint;
      notificarObservadores();
    }
  }

  void registrarObservador(Function(int) callback) {
    if (!_observadores.contains(callback)) {
      _observadores.add(callback);
    }
  }

  void removerObservador(Function(int) callback) {
    _observadores.remove(callback);
  }

  void notificarObservadores() {
    final observadoresActuales = List<Function(int)>.from(_observadores);
    for (var callback in observadoresActuales) {
      callback(_breakPoint);
    }
  }

  void dispose() {
    _observadores.clear();
  }
}