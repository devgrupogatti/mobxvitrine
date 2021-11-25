import 'package:flutter/cupertino.dart';
import 'package:vitrinebeauty/model/model_card_agenda.dart';
import 'package:vitrinebeauty/model/servico.dart';

class AgendaController with ChangeNotifier {
  List<ModelCardAgenda> agendas = [
    ModelCardAgenda(
      id: 01,
      data: '19-04-2020',
      hora: '18:30',
      nomeProfissional: 'Daniella',
      servico: [
        Servico(id: 71, status: false, nome: 'Corte de cabelo', preco: 45.0),
        Servico(id: 72, status: false, nome: 'Depilacao', preco: 30.0),
        Servico(id: 73, status: false, nome: 'Sobrancelha', preco: 25.0),
      ],
      valorTotal: 'R\$94,04',
      enderecoProfissional: 'Rua wander joaquim n° 932 - Barreiro',
      statusAgendamento: 'Aguardando Confirmacao',
    ),
    ModelCardAgenda(
      id: 01,
      // avaliacao: 5,
      data: '19-04-2020',
      hora: '18:30',
      nomeProfissional: 'Barbearia AC',
      servico: [
        Servico(id: 81, status: false, nome: 'Corte de cabelo', preco: 30.0),
        Servico(id: 82, status: false, nome: 'Depilacao', preco: 36.0),
        Servico(id: 83, status: false, nome: 'Sobrancelha', preco: 32.0),
      ],
      valorTotal: 'R\$107,04',
      enderecoProfissional: 'Rua wander joaquim n° 932 - Barreiro',
      statusAgendamento: 'Confirmado',
    ),
    ModelCardAgenda(
      id: 01,
      // avaliacao: 5,
      data: '19-04-2020',
      hora: '18:30',
      nomeProfissional: 'Bento Massagista',
      servico: [
        Servico(id: 11, status: false, nome: 'Corte de cabelo', preco: 35.0),
        Servico(id: 12, status: false, nome: 'Depilacao', preco: 33.0),
      ],
      valorTotal: 'R\$92,04',
      enderecoProfissional: 'Rua wander joaquim n° 932 - Barreiro',
      statusAgendamento: 'Confirmado',
    ),
    ModelCardAgenda(
      id: 01,
      // avaliacao: 5,
      data: '19-04-2020',
      hora: '18:30',
      nomeProfissional: 'Daniella',
      servico: [
        Servico(id: 21, status: false, nome: 'Corte de cabelo', preco: 35.0),
        Servico(id: 22, status: false, nome: 'Depilacao', preco: 30.0),
        Servico(id: 23, status: false, nome: 'Sobrancelha', preco: 28.0),
      ],
      valorTotal: 'R\$94,04',
      enderecoProfissional: 'Rua wander joaquim n° 932 - Barreiro',
      statusAgendamento: 'Aguardando Confirmacao',
    ),
    ModelCardAgenda(
      id: 01,
      // avaliacao: 5,
      data: '19-04-2020',
      hora: '18:30',
      nomeProfissional: 'Daniella',
      servico: [
        Servico(id: 31, status: false, nome: 'Corte de cabelo', preco: 35.0),
        Servico(id: 32, status: false, nome: 'Depilacao', preco: 46.0),
        Servico(id: 33, status: false, nome: 'Sobrancelha', preco: 31.0),
      ],
      valorTotal: 'R\$94,04',
      enderecoProfissional: 'Rua wander joaquim n° 932 - Barreiro',
      statusAgendamento: 'Aguardando Confirmacao',
    ),
  ];

  void adicionarAgenda(ModelCardAgenda agendaCadastrada) {
    agendas.add(agendaCadastrada);
    notifyListeners();
  }

  void removerAgenda(ModelCardAgenda agendaExcuida) {
    agendas.remove(agendaExcuida);
  }
}
