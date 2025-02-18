class SideBarHeightListener{
  double _width = 0.0;
  final List<Function(double)> _observadores = [];

  void setValue(double width){
    _width = width;
    notificarObservadores();
  }

  void registrarObservador(Function(double) callback){
    _observadores.add(callback);
  }

  void notificarObservadores(){
    for (var callback in _observadores){
      callback(_width, );
    }
  }

  double get width => _width;
}