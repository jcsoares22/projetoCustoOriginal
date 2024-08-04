class ModeloMarketplace {
  final int codigo;
  final String empresa;
  final double comissao;
  final double taxaFixa;
  final double descontoMarketplace;
  final double descontoSeller;

  ModeloMarketplace({
    required this.codigo,
    required this.empresa,
    required this.comissao,
    this.taxaFixa = 0.0,
    this.descontoMarketplace = 0.0,
    this.descontoSeller = 0.0,
  });
}
