import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transdata/Model/login_model.dart';

import 'package:transdata/service/db_produtos.dart';

import '../Controllers/ProdutoController/produto_controller.dart';
import '../Model/produto_model.dart';
import '../ui/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final corPadrao = ThemeStayle();
final controller = ProdutoController();

class _HomePageState extends State<HomePage> {
  var dbProduto = DbProdutos();
  List<ProdutoModel> listProdutos = [];

  // ignore: prefer_typing_uninitialized_variables
  var action;

  _updateProduto(ProdutoModel produtoModel, String descricao) async {
    produtoModel.descricao = descricao;
    await dbProduto.updateUsuario(produtoModel);

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 82, 78, 78),
          title: const Text(
            'Produto Atualizado.',
            style: TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            TextButton(
              child: const Icon(
                Icons.clear_outlined,
                color: Colors.white,
              ),
              onPressed: () async {
                await _recuperarLista();
                controller.clean();
                // ignore: use_build_context_synchronously
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
            ),
          ],
        );
      },
    );
  }

  _showDialogUpdateProduto(ProdutoModel produtoModel) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: const Color.fromARGB(255, 82, 78, 78),
              title: Text(
                'Editar produto: ${produtoModel.produto}',
                style: const TextStyle(color: Colors.white70),
              ),
              actions: <Widget>[
                TextField(
                  onChanged: controller.setDescricao,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white60, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Alterar Descrição',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white70, width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Observer(builder: (context) {
                    return Text(
                      controller.validacaoDescricao,
                      style: TextStyle(color: corPadrao.colorTextfild),
                    );
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return TextButton(
                          onPressed: controller.activeBottunUpedate
                              ? null
                              : () async {
                                  await _updateProduto(
                                      produtoModel, controller.descricao);
                                },
                          child: Observer(builder: (_) {
                            return Text('Salvar',
                                style: controller.activeBottunUpedate
                                    ? TextStyle(color: corPadrao.colorTextfild)
                                    : TextStyle(color: corPadrao.colorOrange));
                          }));
                    }),
                    TextButton(
                      child: const Icon(
                        Icons.clear_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.clean();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _deleteSelect(int? id) async {
    var retorno = await dbProduto.removerProduto(id);
    if (retorno == 0) {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 82, 78, 78),
            title: const Text(
              'Ocorre um erro tente novamente!',
              style: TextStyle(color: Colors.white70),
            ),
            actions: <Widget>[
              TextButton(
                child: const Icon(
                  Icons.clear_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
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
            'Produto Exluido.',
            style: TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            TextButton(
              child: const Icon(
                Icons.clear_outlined,
                color: Colors.white,
              ),
              onPressed: () async {
                await _recuperarLista();
                // ignore: use_build_context_synchronously
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
            ),
          ],
        );
      },
    );
  }

  _adicionalista() async {
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('usuario');
    var map = await jsonDecode(action);
    var usuario = LoginModel.fromMap(map[0]);
    var produtoModel = ProdutoModel(
        idUsuario: usuario.id,
        produto: controller.produto,
        descricao: controller.descricao);
    var retorno = await dbProduto.salvarDbProdutos(produtoModel);

    if (retorno != 0) {
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
                onPressed: () async {
                  await _recuperarLista();
                  // ignore: use_build_context_synchronously
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
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
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
            ),
          ],
        );
      },
    );
  }

  _alterarItem(ProdutoModel produtoModel) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 82, 78, 78),
          actions: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Excluir Item",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20),
                          ),
                        ),
                        onPressed: () async {
                          await _deleteSelect(produtoModel.id);
                        },
                      ),
                      TextButton(
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Alterar descrição",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20),
                          ),
                        ),
                        onPressed: () {
                          _showDialogUpdateProduto(produtoModel);
                        },
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: const Icon(
                    Icons.clear_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _recuperarLista();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _recuperarLista() async {
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('usuario');
    var map = await jsonDecode(action);
    var usuario = LoginModel.fromMap(map[0]);

    var anotacoesRecuperadas = await dbProduto.recuperarProdutos(usuario.id);
    // if(anotacoesRecuperadas.lenght == 0 ) return

    controller.setListProdutos(anotacoesRecuperadas);
  }

  _addProduto() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: const Color.fromARGB(255, 82, 78, 78),
              title: const Text(
                'Digite o produto',
                style: TextStyle(color: Colors.white70),
              ),
              actions: <Widget>[
                Observer(builder: (_) {
                  return TextField(
                    onChanged: controller.setProduto,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white60, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Produto',
                      labelStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white70, width: 1.0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: controller.setDescricao,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white60, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Descrição',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white70, width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Observer(builder: (context) {
                    return Text(
                      controller.validacaoProduto,
                      style: TextStyle(color: corPadrao.colorTextfild),
                    );
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return TextButton(
                          onPressed: controller.activeBottun
                              ? null
                              : () async {
                                  controller.clean();
                                  _adicionalista();
                                },
                          child: Observer(builder: (_) {
                            return Text('Salvar',
                                style: controller.activeBottun
                                    ? TextStyle(color: corPadrao.colorTextfild)
                                    : TextStyle(color: corPadrao.colorOrange));
                          }));
                    }),
                    TextButton(
                      child: const Icon(
                        Icons.clear_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.clean();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _recuperarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Lista de compra'),
            Container(
              constraints: const BoxConstraints(maxWidth: 40),
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
          ],
        ),
        backgroundColor: corPadrao.colorOrange,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.99,
          child: Observer(builder: (_) {
            return ListView.builder(
                itemCount: controller.listProdutos.length,
                itemBuilder: (contex, index) {
                  var lista = controller.listProdutos[index];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () async {
                        await _alterarItem(lista);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: const Icon(Icons.album),
                                      title: Text('Produto: ${lista.produto}'),
                                      subtitle:
                                          Text('Descricao: ${lista.descricao}'),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.end,
                                    //   children: <Widget>[
                                    //     TextButton(
                                    //       child: const Text('Excluir'),
                                    //       onPressed: () {/* ... */},
                                    //     ),
                                    //     const SizedBox(width: 8),
                                    //     TextButton(
                                    //       child:
                                    //           const Text('Atualiza item'),
                                    //       onPressed: () {/* ... */},
                                    //     ),
                                    //     const SizedBox(width: 8),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              // const Divider(),
                            ]),
                      ),
                    ),
                  );
                });
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          _addProduto();
        },
        icon: const Icon(Icons.add),
        label: const Text('Adicionar item'),
        backgroundColor: corPadrao.colorOrange,
        tooltip: 'Adicionar item',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
