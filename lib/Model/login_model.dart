class LoginModel {
  late int id;
  String usuario;
  String senha;

  LoginModel({
    required this.id,
    required this.usuario,
    required this.senha,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json["Id"],
      usuario: json["Usuario"],
      senha: json["Senha"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Usuario'] = usuario;
    data['Senha'] = senha;

    return data;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      id: map['Id'],
      usuario: map['Usuario'],
      senha: map['Senha'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Usuario': usuario,
      'Senha': senha,
    };
  }
}
