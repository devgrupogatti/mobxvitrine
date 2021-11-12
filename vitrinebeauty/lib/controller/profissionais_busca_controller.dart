import 'package:flutter/cupertino.dart';
import 'package:vitrinebeauty/model/profissional.dart';
import 'package:vitrinebeauty/model/servico.dart';

class ProfissionaisBuscaController with ChangeNotifier {
  int? indiceEscolhidoBusca;
  Profissional? profissionalSelecionado;

  List<Profissional> profissionaisSelecionados = [
    Profissional(
        id: 11,
        nome: 'Barbearia AC',
        horario: '09:00 as 17:00',
        endereco: 'rua vitrine beauty 3',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 71, status: false, nome: 'Corte de cabelo', preco: 45.0),
          new Servico(id: 72, status: false, nome: 'Depilacao', preco: 30.0),
          new Servico(id: 73, status: false, nome: 'Sobrancelha', preco: 25.0),
        ]),
    Profissional(
        id: 12,
        nome: 'Estabelecimento teste',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 81, status: false, nome: 'Corte de cabelo', preco: 30.0),
          new Servico(id: 82, status: false, nome: 'Depilacao', preco: 36.0),
          new Servico(id: 83, status: false, nome: 'Sobrancelha', preco: 32.0),
        ]),
    Profissional(
        id: 13,
        nome: 'Bento massagista',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 11, status: false, nome: 'Corte de cabelo', preco: 35.0),
          new Servico(id: 12, status: false, nome: 'Depilacao', preco: 33.0),
        ]),
    Profissional(
        id: 14,
        nome: 'Andre designer',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 21, status: false, nome: 'Corte de cabelo', preco: 35.0),
          new Servico(id: 22, status: false, nome: 'Depilacao', preco: 30.0),
          new Servico(id: 23, status: false, nome: 'Sobrancelha', preco: 28.0),
        ]),
    Profissional(
        id: 15,
        nome: 'Thais designer ',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 31, status: false, nome: 'Corte de cabelo', preco: 35.0),
          new Servico(id: 32, status: false, nome: 'Depilacao', preco: 46.0),
          new Servico(id: 33, status: false, nome: 'Sobrancelha', preco: 31.0),
        ]),
    Profissional(
        id: 16,
        nome: 'Thais design de sobrancelhas',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 41, status: false, nome: 'Corte de cabelo', preco: 51.0),
        ]),
    Profissional(
        id: 17,
        nome: 'New Hair',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 51, status: false, nome: 'Corte de cabelo', preco: 35.0),
          new Servico(id: 52, status: false, nome: 'Depilacao', preco: 47.0),
          new Servico(id: 53, status: false, nome: 'Sobrancelha', preco: 27.0),
        ]),
    Profissional(
        id: 18,
        nome: 'Marcelo',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 1234',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          new Servico(
              id: 61, status: false, nome: 'Corte de cabelo', preco: 35.0),
          new Servico(id: 62, status: false, nome: 'Depilacao', preco: 39.0),
          new Servico(id: 64, status: false, nome: 'Unha', preco: 56.0),
        ]),
  ];

  Profissional? retornarProfissionalSelecionado(int? idServicoEscolhido) {
    Profissional? selecionado;
    profissionaisSelecionados.forEach((servico) {
      if (idServicoEscolhido == servico.id) selecionado = servico;
    });
    return selecionado;
  }
}
