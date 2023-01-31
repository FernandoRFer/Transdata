// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on ControllerBase, Store {
  Computed<String>? _$validadorLoginComputed;

  @override
  String get validadorLogin =>
      (_$validadorLoginComputed ??= Computed<String>(() => super.validadorLogin,
              name: 'ControllerBase.validadorLogin'))
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

  late final _$logadoAtom =
      Atom(name: 'ControllerBase.logado', context: context);

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
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

  late final _$obscureTextAtom =
      Atom(name: 'ControllerBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('ControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void setObscureText() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setObscureText');
    try {
      return super.setObscureText();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
id: ${id},
usuario: ${usuario},
senha: ${senha},
logado: ${logado},
validador: ${validador},
obscureText: ${obscureText},
validadorLogin: ${validadorLogin},
validadorSenha: ${validadorSenha},
activeBottun: ${activeBottun}
    ''';
  }
}
