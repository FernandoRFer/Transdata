// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoController on ControllerBase, Store {
  Computed<bool>? _$activeBottunComputed;

  @override
  bool get activeBottun =>
      (_$activeBottunComputed ??= Computed<bool>(() => super.activeBottun,
              name: 'ControllerBase.activeBottun'))
          .value;
  Computed<String>? _$validacaoProdutoComputed;

  @override
  String get validacaoProduto => (_$validacaoProdutoComputed ??=
          Computed<String>(() => super.validacaoProduto,
              name: 'ControllerBase.validacaoProduto'))
      .value;
  Computed<String>? _$validacaoDescricaoComputed;

  @override
  String get validacaoDescricao => (_$validacaoDescricaoComputed ??=
          Computed<String>(() => super.validacaoDescricao,
              name: 'ControllerBase.validacaoDescricao'))
      .value;
  Computed<bool>? _$activeBottunUpedateComputed;

  @override
  bool get activeBottunUpedate => (_$activeBottunUpedateComputed ??=
          Computed<bool>(() => super.activeBottunUpedate,
              name: 'ControllerBase.activeBottunUpedate'))
      .value;

  late final _$idAtom = Atom(name: 'ControllerBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$idUsuarioAtom =
      Atom(name: 'ControllerBase.idUsuario', context: context);

  @override
  int get idUsuario {
    _$idUsuarioAtom.reportRead();
    return super.idUsuario;
  }

  @override
  set idUsuario(int value) {
    _$idUsuarioAtom.reportWrite(value, super.idUsuario, () {
      super.idUsuario = value;
    });
  }

  late final _$produtoAtom =
      Atom(name: 'ControllerBase.produto', context: context);

  @override
  String get produto {
    _$produtoAtom.reportRead();
    return super.produto;
  }

  @override
  set produto(String value) {
    _$produtoAtom.reportWrite(value, super.produto, () {
      super.produto = value;
    });
  }

  late final _$descricaoAtom =
      Atom(name: 'ControllerBase.descricao', context: context);

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$retornoSetProdutoAtom =
      Atom(name: 'ControllerBase.retornoSetProduto', context: context);

  @override
  int get retornoSetProduto {
    _$retornoSetProdutoAtom.reportRead();
    return super.retornoSetProduto;
  }

  @override
  set retornoSetProduto(int value) {
    _$retornoSetProdutoAtom.reportWrite(value, super.retornoSetProduto, () {
      super.retornoSetProduto = value;
    });
  }

  late final _$validacaoProdutoSalvoAtom =
      Atom(name: 'ControllerBase.validacaoProdutoSalvo', context: context);

  @override
  bool get validacaoProdutoSalvo {
    _$validacaoProdutoSalvoAtom.reportRead();
    return super.validacaoProdutoSalvo;
  }

  @override
  set validacaoProdutoSalvo(bool value) {
    _$validacaoProdutoSalvoAtom.reportWrite(value, super.validacaoProdutoSalvo,
        () {
      super.validacaoProdutoSalvo = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void setvalidacaoProdutoSalvo(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setvalidacaoProdutoSalvo');
    try {
      return super.setvalidacaoProdutoSalvo(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListProdutos(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setListProdutos');
    try {
      return super.setListProdutos(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProduto(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setProduto');
    try {
      return super.setProduto(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setDescricao');
    try {
      return super.setDescricao(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
idUsuario: ${idUsuario},
produto: ${produto},
descricao: ${descricao},
retornoSetProduto: ${retornoSetProduto},
validacaoProdutoSalvo: ${validacaoProdutoSalvo},
activeBottun: ${activeBottun},
validacaoProduto: ${validacaoProduto},
validacaoDescricao: ${validacaoDescricao},
activeBottunUpedate: ${activeBottunUpedate}
    ''';
  }
}
