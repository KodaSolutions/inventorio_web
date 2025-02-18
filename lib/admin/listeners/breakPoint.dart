class BreakPoint{
  int _breakPoint = 0;
  final List<Function(int)> _observadores = [];

  void setValue(int breakpoint){
    _breakPoint = breakpoint;
    notificarObservadores();
  }

  void registrarObservador(Function(int) callback){
    _observadores.add(callback);
  }

  void notificarObservadores(){
    for (var callback in _observadores){
      callback(_breakPoint, );
    }
  }

  int get expand => _breakPoint;
}