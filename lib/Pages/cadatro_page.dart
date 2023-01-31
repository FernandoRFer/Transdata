import '../Controllers/CadastroController/cadastro_controller.dart';
import '../ui/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({super.key});

  final _controller = CadastroController();
  final corPadrao = ThemeStayle();

  @override
  Widget build(BuildContext context) {
    Future<Object> salvarCadastro() async {
      await _controller.salvarUsuario();
      if (_controller.result) {
        return showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 82, 78, 78),
              title: const Text(
                'Cadastro Salvo! :D',
                style: TextStyle(color: Colors.white70),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Icon(
                    Icons.clear_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                ),
              ],
            );
          },
        );
      }
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 82, 78, 78),
            title: const Text(
              'Usuário já possui cadastro!',
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

    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.centerRight,
            child: Image.asset(
              "assets/logo.png",
              scale: 1.8,
            )),
        backgroundColor: corPadrao.colorOrange,
      ),
      body: Center(child: Observer(builder: (_) {
        return _controller.validador
            ? Container(
                //width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Builder(builder: (context) {
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Cadastro',
                            style: TextStyle(
                              fontSize: 45,
                              color: corPadrao.colorOrange,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10, bottom: 2),
                              child: TextField(
                                onChanged: _controller.setLogin,
                                obscureText: false,
                                style:
                                    TextStyle(color: corPadrao.colorCadastro),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  labelText: 'Login',
                                  labelStyle:
                                      TextStyle(color: corPadrao.colorCadastro),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: corPadrao.colorCadastro,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              _controller.validadorLogin,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12),
                            );
                          }),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 10, left: 10, bottom: 2),
                              child: TextField(
                                onChanged: _controller.setSenha,
                                obscureText: false,
                                style:
                                    TextStyle(color: corPadrao.colorCadastro),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: corPadrao.colorCadastro,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  labelText: 'Senha',
                                  labelStyle:
                                      TextStyle(color: corPadrao.colorCadastro),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: corPadrao.colorCadastro,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              _controller.validadorSenha,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12),
                            );
                          }),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 10, left: 10, bottom: 2),
                              child: TextField(
                                onChanged: _controller.setSenha2,
                                obscureText: false,
                                style:
                                    TextStyle(color: corPadrao.colorCadastro),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: corPadrao.colorPrincipal,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  labelText: 'Confirme a Senha',
                                  labelStyle:
                                      TextStyle(color: corPadrao.colorCadastro),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: corPadrao.colorCadastro,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              _controller.validadorSenha2,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12),
                            );
                          }),
                          Padding(
                              padding: const EdgeInsets.all(16),
                              child: Observer(builder: (context) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: corPadrao.colorPrincipal,
                                  ),
                                  onPressed: _controller.activeBottun
                                      ? () {
                                          salvarCadastro();
                                        }
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Cadastrar',
                                        style: TextStyle(
                                          color: corPadrao.colorTextfild,
                                          fontSize: 20,
                                        )),
                                  ),
                                );
                              })),
                        ],
                      ),
                    ),
                  );
                }),
              )
            : CircularProgressIndicator(
                color: corPadrao.colorOrange,
              );
      })),
    );
  }
}
