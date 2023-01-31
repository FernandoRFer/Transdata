import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../Model/login_model.dart';
import '../../service/db_usuarios.dart';

part 'cadastro_controller.g.dart';

class CadastroController = ControllerBase with _$CadastroController;

abstract class ControllerBase with Store {
  ControllerBase();

  final controlleSenha = TextEditingController();

  @observable
  String usuario = '';

  @observable
  String senha = '';

  @observable
  String senha2 = '';

  @observable
  bool validador = true;

  @observable
  bool result = true;

  @action
  Future<void> salvarUsuario() async {
    validador = false;
    var dbLogin = DbLogin();
    var loginModel = LoginModel(id: 0, usuario: usuario, senha: senha);
    var resultPesquisa = await dbLogin.salvarUsuario(loginModel);
    await Future.delayed(const Duration(seconds: 1));
    result = resultPesquisa;
    validador = true;
  }

  @action
  void setLogin(valor) {
    usuario = valor;
  }

  @action
  void setSenha(valor) {
    senha = valor;
  }

  @action
  void setSenha2(valor) {
    senha2 = valor;
  }

  @computed
  String get validadorLogin {
    String pattern1 = r'^.{4,32}$';
    //String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    var regExp = RegExp(pattern1);
    if (usuario == '') {
      return "Informe a Usuário";
    }
    if (!regExp.hasMatch(usuario)) {
      return "Login deve ter pelo menos 4 caracteres.";
    }
    return 'Usuario valido';
  }

  @computed
  String get validadorSenha2 {
    if (senha2 == '') {
      return 'Confirme a Senha';
    }
    if (senha == senha2) {
      return "Senha confirmada ";
    }
    return 'Confirmação de senha invalida';
  }

  @computed
  String get validadorSenha {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    var regExp = RegExp(pattern);
    if (senha == '') {
      return 'Informe a Senha';
    }
    if (!regExp.hasMatch(senha)) {
      return "Senha deve ter pelo menos o mínimo de:\n 8 caracteres,\n 1 caractere especial\n uma letra Maiúsculas e minúsculas.";
    }
    return 'Senha valida';
  }

  @computed
  bool get activeBottun {
    String pattern1 = r'^.{4,32}$';
    var regExpUsuario = RegExp(pattern1);

    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    var regExp = RegExp(pattern);
    !regExp.hasMatch(senha);
    if (regExp.hasMatch(senha) &&
        regExpUsuario.hasMatch(usuario) &&
        senha == senha2) {
      return true;
    } else {
      return false;
    }
  }
}
