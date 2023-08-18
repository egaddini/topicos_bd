import 'package:crud_usuario/app/usuario/fila_cadastro_delete_repository.dart';
import 'package:crud_usuario/app/usuario/usuario_controller.dart';
import 'package:get/get.dart';

class UsuarioBindings implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => UsuarioController(FilaCadastroRestService()));
  }

}