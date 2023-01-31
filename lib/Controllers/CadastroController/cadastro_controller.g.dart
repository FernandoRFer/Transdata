// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroController on ControllerBase, Store {
  Computed<String>? _$validadorLoginComputed;

  @override
  String get validadorLogin =>
      (_$validadorLoginComputed ??= Computed<String>(() => super.validadorLogin,
              name: 'ControllerBase.validadorLogin'))
          .value;
  Computed<String>? _$validadorSenha2Computed;

  @override
  String get validadorSenha2 => (_$validadorSenha2Computed ??= Computed<String>(
          () => super.validadorSenha2,
          name: 'ControllerBase.validadorSenha2'))
      .value;
  Computed<String>? _$validadorSenhaComputed;

  @override
  String get validadorSenha =>
      (_$validadorSenhaComputed ??= Computed<String>(() => super.validadorSenha,
              name: 'ControllerBase.validadorSenha'))
          .value;
  Computed<bool>? _$activeBottunComputed;

  @override
  bool get activeBottun =>
      (_$activeBottunComputed ??= Computed<bool>(() => super.activeBottun,
              name: 'ControllerBase.activeBottun'))
          .value;

  late final _$usuarioAtom =
      Atom(name: 'ControllerBase.usuario', context: context);

  @override
  String get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$senhaAtom = Atom(name: 'ControllerBase.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$senha2Atom =
      Atom(name: 'ControllerBase.senha2', context: context);

  @override
  String get senha2 {
    _$senha2Atom.reportRead();
    return super.senha2;
  }

  @override
  set senha2(String value) {
    _$senha2Atom.reportWrite(value, super.senha2, () {
      super.senha2 = value;
    });
  }

  late final _$validadorAtom =
      Atom(name: 'ControllerBase.validador', context: context);

  @override
  bool get validador {
    _$validadorAtom.reportRead();
    return super.validador;
  }

  @override
  set validador(bool value) {
    _$validadorAtom.reportWrite(value, super.validador, () {
      super.validador = value;
    });
  }

  late final _$resultAtom =
      Atom(name: 'ControllerBase.result', context: context);

  @override
  bool get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(bool value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$salvarUsuarioAsyncAction =
      AsyncAction('ControllerBase.salvarUsuario', context: context);

  @override
  Future<void> salvarUsuario() {
    return _$salvarUsuarioAsyncAction.run(() => super.salvarUsuario());
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void setLogin(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setLogin');
    try {
      return super.setLogin(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setSenha');
    try {
      return super.setSenha(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha2(dynamic valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setSenha2');
    try {
      return super.setSenha2(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
senha: ${senha},
senha2: ${senha2},
validador: ${validador},
result: ${result},
validadorLogin: ${validadorLogin},
validadorSenha2: ${validadorSenha2},
validadorSenha: ${validadorSenha},
activeBottun: ${activeBottun}
    ''';
  }
}
