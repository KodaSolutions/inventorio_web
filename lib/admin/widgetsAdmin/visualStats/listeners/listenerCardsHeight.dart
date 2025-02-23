class CardsHeight{
  double _finalHeight = 0;
  final List<Function(double)> _observadores = [];

  void setValue(double finalHeight){
    _finalHeight = finalHeight;
    notificarObservadores();
  }

  void registrarObservador(Function(double) callback){
    _observadores.add(callback);
  }

  void notificarObservadores(){
    for (var callback in _observadores){
      callback(_finalHeight, );
    }
  }

  double get finalHeight => _finalHeight;
}