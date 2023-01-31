import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../Model/login_model.dart';

class DbLogin {
  String nomeTabela = "usuarios";
  static final DbLogin _dbMusica = DbLogin._();
  Database? _db;

  factory DbLogin() {
    return _dbMusica;
  }

  DbLogin._();

  get db async {
    _db ??= await inicializarDB();
    return _db;
  }

  _onCreate(Database db, int version) {
    String sql =
        "CREATE TABLE $nomeTabela (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Usuario VARCHAR,Senha VARCHAR)";
    db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<bool> salvarUsuario(LoginModel loginModel) async {
    Database bancoDados = await db;
    var reculpera = await recuperarUsuario(loginModel);

    if (reculpera.length == 0) {
      var usuario = loginModel.toMap();

      // ignore: unused_local_variable
      int resultado = await bancoDados.insert(nomeTabela, usuario);
      return true;
    } else {
      return false;
    }
  }

  recuperarUsuario(LoginModel loginModel) async {
    var bancoDados = await db;
    String usuario = loginModel.usuario;

    String sql = "SELECT * FROM $nomeTabela WHERE Usuario = '$usuario'";
    var anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future recuperarLoginUsuario(LoginModel loginModel) async {
    var bancoDados = await db;
    String usuario = loginModel.usuario;
    String senha = loginModel.senha;

    String sql =
        "SELECT * FROM $nomeTabela WHERE Usuario = '$usuario' AND Senha = '$senha' ";
    // String sql =
    //     "S ELECT * FROM $nomeTabela WHERE Usuario = '$usuario' AND Senha = '$senha'";
    var itens = await bancoDados.rawQuery(sql);
    List<LoginModel> listaTemporaria = [];
    for (var item in itens) {
      LoginModel lista = LoginModel.fromMap(item);
      listaTemporaria.add(lista);
    }

    return listaTemporaria;
  }

  Future<bool> atualizarUsuario(LoginModel loginModel) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, loginModel,
        where: "id = ?", whereArgs: [loginModel.id]);
  }

  Future<int> removerUsuario(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
