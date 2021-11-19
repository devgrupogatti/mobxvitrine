// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicoControllerStore on _ServicoControllerStore, Store {
  final _$valorTotalAtom = Atom(name: '_ServicoControllerStore.valorTotal');

  @override
  double get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(double value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  final _$habilitadoAtom = Atom(name: '_ServicoControllerStore.habilitado');

  @override
  bool get habilitado {
    _$habilitadoAtom.reportRead();
    return super.habilitado;
  }

  @override
  set habilitado(bool value) {
    _$habilitadoAtom.reportWrite(value, super.habilitado, () {
      super.habilitado = value;
    });
  }

  final _$dataSelecionadaAtom =
      Atom(name: '_ServicoControllerStore.dataSelecionada');

  @override
  DateTime get dataSelecionada {
    _$dataSelecionadaAtom.reportRead();
    return super.dataSelecionada;
  }

  @override
  set dataSelecionada(DateTime value) {
    _$dataSelecionadaAtom.reportWrite(value, super.dataSelecionada, () {
      super.dataSelecionada = value;
    });
  }

  final _$horaSelecionadaAtom =
      Atom(name: '_ServicoControllerStore.horaSelecionada');

  @override
  TimeOfDay get horaSelecionada {
    _$horaSelecionadaAtom.reportRead();
    return super.horaSelecionada;
  }

  @override
  set horaSelecionada(TimeOfDay value) {
    _$horaSelecionadaAtom.reportWrite(value, super.horaSelecionada, () {
      super.horaSelecionada = value;
    });
  }

  final _$selectDataAsyncAction =
      AsyncAction('_ServicoControllerStore.selectData');

  @override
  Future selectData(BuildContext context) {
    return _$selectDataAsyncAction.run(() => super.selectData(context));
  }

  final _$selectTimeAsyncAction =
      AsyncAction('_ServicoControllerStore.selectTime');

  @override
  Future selectTime(BuildContext context) {
    return _$selectTimeAsyncAction.run(() => super.selectTime(context));
  }

  final _$_ServicoControllerStoreActionController =
      ActionController(name: '_ServicoControllerStore');

  @override
  dynamic somatorio(Servico servicoSelecionado) {
    final _$actionInfo = _$_ServicoControllerStoreActionController.startAction(
        name: '_ServicoControllerStore.somatorio');
    try {
      return super.somatorio(servicoSelecionado);
    } finally {
      _$_ServicoControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeChecked(int index) {
    final _$actionInfo = _$_ServicoControllerStoreActionController.startAction(
        name: '_ServicoControllerStore.changeChecked');
    try {
      return super.changeChecked(index);
    } finally {
      _$_ServicoControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCarrinho(Servico selecionado) {
    final _$actionInfo = _$_ServicoControllerStoreActionController.startAction(
        name: '_ServicoControllerStore.addCarrinho');
    try {
      return super.addCarrinho(selecionado);
    } finally {
      _$_ServicoControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerCarrinho(Servico selecionado) {
    final _$actionInfo = _$_ServicoControllerStoreActionController.startAction(
        name: '_ServicoControllerStore.removerCarrinho');
    try {
      return super.removerCarrinho(selecionado);
    } finally {
      _$_ServicoControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void servicoSelecionado() {
    final _$actionInfo = _$_ServicoControllerStoreActionController.startAction(
        name: '_ServicoControllerStore.servicoSelecionado');
    try {
      return super.servicoSelecionado();
    } finally {
      _$_ServicoControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorTotal: ${valorTotal},
habilitado: ${habilitado},
dataSelecionada: ${dataSelecionada},
horaSelecionada: ${horaSelecionada}
    ''';
  }
}
