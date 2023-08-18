import 'dart:convert';

import 'package:crud_usuario/app/usuario/usuario_model.dart';
import 'package:dio/dio.dart';

class FilaCadastroRestService  {

  Future<String> register(UsuarioModel entity) async {
    String message = '';

    final result = await Dio().post(
      'http://localhost:8080/api/usuario',
      data: jsonEncode((entity.toMap())),
      options: Options(headers: {'content-type': 'application/json;'}),
    );
    if (result.statusCode == 200) {
      message = result.statusMessage!;
    } 

    return message;
  }

  Future<List<UsuarioModel>> getList({String? query}) async {
    List<UsuarioModel> results = [];

    final response = await Dio().get(
      'http://localhost:9090/api/usuario',
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data as List<dynamic>;
      results = jsonList.map((json) => UsuarioModel.fromMap(json)).toList();
    } 
    return results;
  }

    Future<String> delete(int id) async {
    String message = '';
    final result = await Dio().delete(
      'http://localhost:9090/api/usuario/$id',
      options: Options(headers: {'content-type': 'application/json;'}),
    );
    if (result.statusCode == 200) {
      message = result.statusMessage!;
    } 
    return message;
  }

}