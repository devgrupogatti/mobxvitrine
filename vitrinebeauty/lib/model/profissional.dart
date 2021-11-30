import 'package:vitrinebeauty/model/servico.dart';

class Profissional {
  int? id;
  String? nome;
  String? horario;
  List<Map<String, String>>? formaPagamento;
  String? endereco;
  String? descricao;
  List<Servico>? servicos;

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
