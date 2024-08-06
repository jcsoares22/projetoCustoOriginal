class ModeloMarketplace {
  int _codigo;
  String _empresa;
  double _comissao;
  double _taxaFixa;
  double _descontoMarketplace;
  double _descontoSeller;

  ModeloMarketplace({
    required int codigo,
    required String empresa,
    required double comissao,
    double taxaFixa = 0.0,
    double descontoMarketplace = 0.0,
    double descontoSeller = 0.0,
  })  : _codigo = codigo,
        _empresa = empresa,
        _comissao = comissao,
        _taxaFixa = taxaFixa,
        _descontoMarketplace = descontoMarketplace,
        _descontoSeller = descontoSeller;

  Marketplace() {
    // TODO: implement Marketplace
    throw UnimplementedError();
  }

  // Getters
  int get codigo => _codigo;
  String get empresa => _empresa;
  double get comissao => _comissao;
  double get taxaFixa => _taxaFixa;
  double get descontoMarketplace => _descontoMarketplace;
  double get descontoSeller => _descontoSeller;

  // Setters
  set codigo(int value) {
    _codigo = value;
  }

  set empresa(String value) {
    _empresa = value;
  }

  set comissao(double value) {
    _comissao = value;
  }

  set taxaFixa(double value) {
    _taxaFixa = value;
  }

  set descontoMarketplace(double value) {
    _descontoMarketplace = value;
  }

  set descontoSeller(double value) {
    _descontoSeller = value;
  }
}
