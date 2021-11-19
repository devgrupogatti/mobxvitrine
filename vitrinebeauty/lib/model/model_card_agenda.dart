import 'package:vitrinebeauty/model/servico.dart';

class ModelCardAgenda {
  int? id;
  // int? avaliacao;
  String? data;
  String? hora;
  String? nomeProfissional;
  List<String>? servico;
  String? valorTotal;
  String? enderecoProfissional;
  String? statusAgendamento;
  ModelCardAgenda({
    this.id,
    // this.avaliacao,
    this.data,
    this.hora,
    this.nomeProfissional,
    this.servico,
    this.valorTotal,
    this.enderecoProfissional,
    this.statusAgendamento,
  });
}
