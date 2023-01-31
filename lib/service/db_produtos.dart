import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:transdata/Model/produto_model.dart';

class DbProdutos {
  String nomeTabela = "produtos";
  static final DbProdutos _dbMusica = DbProdutos._();
  Database? _db;

  factory DbProdutos() {
    return _dbMusica;
  }

  DbProdutos._();

  get db async {
    _db ??= await inicializarDB();
    return _db;
  }

  _onCreate(Database db, int version) {
    String sql =
        "CREATE TABLE $nomeTabela (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,IdUsuario int ,Produtos VARCHAR ,Descricao VARCHAR)";
    db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "produtos.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int> salvarDbProdutos(ProdutoModel produtoModel) async {
    Database bancoDados = await db;
    var usuario = produtoModel.toMap();

    int resultado = await bancoDados.insert(nomeTabela, usuario);
    return resultado;
  }

  Future recuperarProdutos(int? id) async {
    var bancoDados = await db;

    String sql = "SELECT * FROM $nomeTabela WHERE IdUsuario = $id ";

    var itens = await bancoDados.rawQuery(sql);
    List<ProdutoModel> listaTemporaria = [];
    for (var item in itens) {
      var lista = ProdutoModel.fromMap(item);
      listaTemporaria.add(lista);
    }
    // ignore: avoid_print
    print(listaTemporaria);
    return listaTemporaria;
  }

  Future<void> updateUsuario(ProdutoModel produtoModel) async {
    var bancoDados = await db;
    String sql =
        "UPDATE $nomeTabela SET Produtos = '${produtoModel.produto}' , Descricao = '${produtoModel.descricao}'  WHERE id = ${produtoModel.id}";

    var resultado = await bancoDados.rawQuery(sql);

    return resultado;
  }

  Future<int> removerProduto(int? id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
