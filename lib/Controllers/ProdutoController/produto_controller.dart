import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../Model/produto_model.dart';
part 'produto_controller.g.dart';

class ProdutoController = ControllerBase with _$ProdutoController;

abstract class ControllerBase with Store {
  ControllerBase();

  final controlleSenha = TextEditingController();

  @observable
  int id = 0;

  @observable
  int idUsuario = 0;

  @observable
  String produto = '';

  @observable
  String descricao = '';

  @observable
  int retornoSetProduto = 0;

  @observable
  bool validacaoProdutoSalvo = true;

  @action
  void setvalidacaoProdutoSalvo(valor) {
    validacaoProdutoSalvo = valor;
  }

  @computed
  bool get activeBottun {
    if (produto == '' || descricao == '') {
      return true;
    }
    return false;
  }

  @computed
  String get validacaoProduto {
    if (produto == '' || descricao == '') {
      return 'Preencha todos os campos';
    }
    return '';
  }

  @computed
  String get validacaoDescricao {
    if (descricao == '') {
      return 'Preencha todos os campos';
    }
    return '';
  }

  @computed
  bool get activeBottunUpedate {
    if (descricao == '') {
      return true;
    }
    return false;
  }

  ObservableList<ProdutoModel> listProdutos = ObservableList();

  @action
  void setListProdutos(valor) {
    listProdutos.clear();
    listProdutos.addAll(valor);
    setProduto('');
    setDescricao('');
  }

  @action
  void setProduto(valor) {
    produto = valor;
  }

  @action
  void setDescricao(valor) {
    descricao = valor;
  }

  @action
  void clean() {
    setvalidacaoProdutoSalvo(true);
  }
}
