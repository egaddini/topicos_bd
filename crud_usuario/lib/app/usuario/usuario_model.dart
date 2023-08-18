// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsuarioModel {

  int? id; 
  String nome;
  String telefone;
  String endereco;
  
  UsuarioModel({
    this.id,
    required this.nome,
    required this.telefone,
    required this.endereco,
  });


  UsuarioModel copyWith({
    int? id,
    String? nome,
    String? telefone,
    String? endereco,
  }) {
    return UsuarioModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      endereco: map['endereco'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsuarioModel(id: $id, nome: $nome, telefone: $telefone, endereco: $endereco)';
  }

  @override
  bool operator ==(covariant UsuarioModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.telefone == telefone &&
      other.endereco == endereco;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      telefone.hashCode ^
      endereco.hashCode;
  }
}
