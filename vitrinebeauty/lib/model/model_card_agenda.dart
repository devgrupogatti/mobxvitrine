import 'package:vitrinebeauty/model/servico.dart';

class ModelCardAgenda {
  String? id;
  int? avaliacao;
  String? data;
  String? hora;
  String? nomeCliente;
  List<String>? servico;

  ModelCardAgenda({
    this.id,
    this.avaliacao,
    this.data,
    this.hora,
    this.nomeCliente,
    this.servico,
  });
}
