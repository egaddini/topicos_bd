import 'package:crud_usuario/app/usuario/fila_cadastro_delete_repository.dart';
import 'package:crud_usuario/app/usuario/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  
  bool sort = true;
  RxBool isLoading = true.obs;

  TextEditingController formFieldC = TextEditingController();

  RxList<UsuarioModel> myData = <UsuarioModel>[].obs;
  
  final FilaCadastroRestService _filaCadastroSvc;

  UsuarioController(this._filaCadastroSvc);


  @override
  void onInit() async {
    myData.addAll(await _filaCadastroSvc.getList());
    isLoading = false.obs;
    super.onInit();
  }

  void deleteItem(int index) async {
      UsuarioModel data = myData[index];
      _filaCadastroSvc.delete(data.id!).then((_) {
      myData.removeAt(index);
    }); 
  }

  void saveItem(UsuarioModel usuario) async {
    isLoading.value = true;
    _filaCadastroSvc.register(usuario).then((_) async {
      myData.removeRange(0, myData.value.length);
      myData.addAll(await _filaCadastroSvc.getList());
      Get.back();
    });  
  }

}