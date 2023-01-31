class ProdutoModel {
  int? id;
  int? idUsuario;
  String produto;
  String descricao;

  ProdutoModel({
    this.id,
    this.idUsuario,
    required this.produto,
    required this.descricao,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json["Id"],
      idUsuario: json["IdUsuario"],
      produto: json["Produto"],
      descricao: json["Descricao"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['IdUsuario'] = idUsuario;
    data['Produtos'] = produto;
    data['Senha'] = descricao;

    return data;
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['Id'],
      idUsuario: map["IdUsuario"],
      produto: map['Produtos'],
      descricao: map['Descricao'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'IdUsuario': idUsuario,
      'Produtos': produto,
      'Descricao': descricao,
    };
  }
}
