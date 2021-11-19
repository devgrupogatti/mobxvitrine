import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrinebeauty/model/servico.dart';
part 'servico_controller.g.dart';

class ServicoControllerStore = _ServicoControllerStore
    with _$ServicoControllerStore;

abstract class _ServicoControllerStore with Store {
  var listaServico = ObservableList<Servico>();
  List<Servico> servicosSelecionados = [];

  @observable
  double valorTotal = 0.0;
  @observable
  bool habilitado = false;
  @observable
  DateTime dataSelecionada = DateTime.now();
  @observable
  TimeOfDay horaSelecionada = TimeOfDay.now();

  @action
  somatorio(Servico servicoSelecionado) {
    valorTotal = 0.0;
    for (var element in servicosSelecionados) {
      valorTotal = valorTotal + element.preco!;
    }
  }

  @action
  void changeChecked(int index) {
    //int ind = index;
    listaServico[index].status = !listaServico[index].status!;
    if (listaServico[index].status!) {
      addCarrinho(listaServico[index]);
    } else {
      removerCarrinho(listaServico[index]);
    }
    servicoSelecionado();
    somatorio(listaServico[index]);
  }

  @action
  void addCarrinho(Servico selecionado) {
    servicosSelecionados.add(selecionado);
  }

  @action
  void removerCarrinho(Servico selecionado) {
    servicosSelecionados.remove(selecionado);
  }

  @action
  void servicoSelecionado() {
    if (servicosSelecionados.isNotEmpty) {
      habilitado = true;
    } else {
      habilitado = false;
    }
  }

  @action
  selectData(BuildContext context) async {
    final DateTime? data = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    dataSelecionada = data!;
  }

  @action
  selectTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: horaSelecionada,
    );

    horaSelecionada = time!;
  }
}
