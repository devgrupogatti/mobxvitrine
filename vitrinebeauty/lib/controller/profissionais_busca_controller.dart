import 'package:flutter/cupertino.dart';
import 'package:vitrinebeauty/model/profissional.dart';

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
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
          {'tipo': 'Sobrancelha'}
        ]),
    Profissional(
        id: 12,
        nome: 'Estabelecimento teste',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
          {'tipo': 'Sobrancelha'}
        ]),
    Profissional(
        id: 13,
        nome: 'Bento massagista',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
        ]),
    Profissional(
        id: 14,
        nome: 'Andre designer',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
          {'tipo': 'Sobrancelha'}
        ]),
    Profissional(
        id: 15,
        nome: 'Thais designer ',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
          {'tipo': 'Sobrancelha'}
        ]),
    Profissional(
        id: 16,
        nome: 'Thais design de sobrancelhas',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
        ]),
    Profissional(
        id: 17,
        nome: 'New Hair',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 2334',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
          {'tipo': 'Sobrancelha'}
        ]),
    Profissional(
        id: 18,
        nome: 'Marcelo',
        horario: '09:00 as 17:00',
        endereco: 'av raja gabaglia 1234',
        descricao:
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
        servicos: [
          {'tipo': 'Corte de cabelo'},
          {'tipo': 'Depilacao'},
          {'tipo': 'Unha'}
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
