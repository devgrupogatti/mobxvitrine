import 'package:vitrinebeauty/model/model_card_historico.dart';

class HistoricoController {
  List<ModelCardHistorico> historicos = [
    ModelCardHistorico(
        id: '00001',
        avaliacao: 5.0,
        data: '19-04-2020',
        hora: '18:30',
        nomeCliente: 'Daniella',
        servico: ['Corte de cabelo', 'Corte de cabelo', 'Corte de cabelo']),
    ModelCardHistorico(
        id: '00001',
        avaliacao: 3.5,
        data: '19-04-2020',
        hora: '18:30',
        nomeCliente: 'Daniella',
        servico: ['Corte de cabelo', 'Corte de cabelo', 'Corte de cabelo']),
    ModelCardHistorico(
        id: '00001',
        avaliacao: 4.0,
        data: '19-04-2020',
        hora: '18:30',
        nomeCliente: 'Daniella',
        servico: ['Corte de cabelo', 'Corte de cabelo', 'Corte de cabelo']),
    ModelCardHistorico(
        id: '00001',
        avaliacao: 4.5,
        data: '19-04-2020',
        hora: '18:30',
        nomeCliente: 'Daniella',
        servico: ['Corte de cabelo', 'Corte de cabelo', 'Corte de cabelo']),
    ModelCardHistorico(
        id: '00001',
        avaliacao: 5,
        data: '19-04-2020',
        hora: '18:30',
        nomeCliente: 'Daniella',
        servico: ['Corte de cabelo', 'Corte de cabelo', 'Corte de cabelo']),
  ];

  List<ModelCardHistorico> get listCatdHistorico => historicos;
}
