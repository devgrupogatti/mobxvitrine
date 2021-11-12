import 'dart:typed_data';

class Profissional {
  int? id;
  String? nome;
  String? horario;
  List<Map<String, String>>? formaPagamento;
  String? endereco;
  String? descricao;
  List<Map<String, String>>? servicos;

  //Uint8List? imagemPerfil;
  //List<Uint8List> outrasImagens;

  Profissional(
      {this.id,
      this.nome,
      this.horario,
      this.formaPagamento,
      this.descricao,
      this.endereco,
      this.servicos});
}
