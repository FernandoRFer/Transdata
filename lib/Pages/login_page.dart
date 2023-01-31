import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../Controllers/LoginController/login_controller.dart';
import '../ui/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final corPadrao = ThemeStayle();
final controller = LoginController();

class _LoginPageState extends State<LoginPage> {
  Future<Object> loginUsurario() async {
    await controller.login();

    if (!controller.logado) {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 82, 78, 78),
            title: const Text(
              'Usuário ou Senha INVALIDO',
              style: TextStyle(color: Colors.white70),
            ),
            actions: <Widget>[
              TextButton(
                child: const Icon(
                  Icons.clear_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    // ignore: use_build_context_synchronously
    return Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao.colorPrincipal,
      body: Center(
        child: Observer(builder: (_) {
          return controller.validador
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  //   color: const Color.fromARGB(255, 70, 20, 118), //rgb(77 20 118)
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Observer(builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/logo.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10, bottom: 2),
                                child: TextField(
                                  onChanged: controller.setLogin,
                                  obscureText: false,
                                  style:
                                      TextStyle(color: corPadrao.colorTextfild),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: corPadrao.colorTextfild,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    labelText: 'Usuario',
                                    labelStyle: TextStyle(
                                        color: corPadrao.colorTextfild),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: corPadrao.colorTextfild,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                  controller.validadorLogin,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: corPadrao.colorTextfild),
                                );
                              }),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 10, left: 10, bottom: 2),
                                child: TextField(
                                  obscureText: controller.obscureText,
                                  onChanged: controller.setSenha,
                                  style:
                                      TextStyle(color: corPadrao.colorTextfild),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: corPadrao.colorTextfild,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    labelText: 'Senha',
                                    labelStyle: TextStyle(
                                        color: corPadrao.colorTextfild),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: corPadrao.colorTextfild,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                  controller.validadorSenha,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: corPadrao.colorTextfild),
                                );
                              }),
                              Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Observer(builder: (context) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 115, 0),
                                      ),
                                      onPressed: controller.activeBottun
                                          ? () async {
                                              loginUsurario();
                                            }
                                          : null,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('LOGAR',
                                            style: TextStyle(
                                              color: corPadrao.colorTextfild,
                                              fontSize: 20,
                                            )),
                                      ),
                                    );
                                  })),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.bottomRight,
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                child: TextButton(
                                    child: Text('Cadastro',
                                        style: TextStyle(
                                          color: corPadrao.colorOrange,
                                          fontSize: 15,
                                        )),
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .pushNamed('/cadastro');
                                    }),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              : CircularProgressIndicator(color: corPadrao.colorOrange);
        }),
      ),
    );
  }
}
