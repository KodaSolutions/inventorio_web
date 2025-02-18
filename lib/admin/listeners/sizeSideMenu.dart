class ChangeSizeSideMenu{
  bool _expand = false;
  final List<Function(bool)> _observadores = [];

  void setValue(bool expand){
    _expand = expand;
    notificarObservadores();
  }

  void registrarObservador(Function(bool) callback){
    _observadores.add(callback);
  }

  void notificarObservadores(){
    for (var callback in _observadores){
      callback(_expand, );
    }
  }

  bool get expand => _expand;
}