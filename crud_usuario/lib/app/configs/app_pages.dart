import 'package:crud_usuario/app/usuario/usuario_bindings.dart';
import 'package:crud_usuario/app/usuario/usuario_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const UsuarioScreen(),
      binding: UsuarioBindings(),
    ),

  ];
}