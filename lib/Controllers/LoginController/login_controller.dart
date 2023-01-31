import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/login_model.dart';
import '../../service/db_usuarios.dart';
part 'login_controller.g.dart';

class LoginController = ControllerBase with _$LoginController;

abstract class ControllerBase with Store {
  ControllerBase();

  final controlleSenha = TextEditingController();

  @observable
  int id = 0;

  @observable
  String usuario = '';

  @observable
  String senha = '';

  @observable
  bool logado = true;

  @observable
  bool validador = true;

  @observable
  bool obscureText = true;

  @action
  void setObscureText() {
    obscureText = !obscureText;
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
  Future<void> login() async {
    validador = false;
    var dbLogin = DbLogin();

    var loginModel = LoginModel(id: 0, usuario: usuario, senha: senha);
    var recuperado = await dbLogin.recuperarLoginUsuario(loginModel);
    await Future.delayed(const Duration(seconds: 1));

    if (recuperado.length == 0) {
      logado = false;
    } else {
      logado = true;
      late List<LoginModel> usuarioLogado;
      usuarioLogado = recuperado;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('usuario', jsonEncode(usuarioLogado));

      validador = true;
    }

    validador = true;
  }

  @computed
  String get validadorLogin {
    String pattern1 = r'^.{4,32}$';
    //String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    var regExp = RegExp(pattern1);
    if (usuario == '') {
      return "Informe a Usuario";
    }
    if (!regExp.hasMatch(usuario)) {
      return "Login deve ter pelo menos 4 caracteres";
    }
    return 'Usuario valido';
  }

  @computed
  String get validadorSenha {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    var regExp = RegExp(pattern);
    if (senha == '') {
      return 'Informe a Senha';
    }
    if (!regExp.hasMatch(senha)) {
      return "Senha deve ter pelo menos o mínimo de:\n 8 caracteres,\n 1 caractere especial\n 1 letra minúscula e 1 letra maiuscula ";
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
    if (regExp.hasMatch(senha) && regExpUsuario.hasMatch(usuario)) {
      return true;
    }
    return false;
  }
}
