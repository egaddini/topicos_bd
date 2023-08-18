library usuario_screen;

import 'package:crud_usuario/app/usuario/usuario_controller.dart';
import 'package:crud_usuario/app/usuario/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'row_source.dart';
part 'novo_usuario.dart';

class UsuarioScreen extends GetView<UsuarioController>  {

  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de usuarios')),
      body: SingleChildScrollView(
        child: Column(
          children: [ 
            SizedBox(
              width: double.infinity,
              child: Obx(() => PaginatedDataTable(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.formFieldC,
                            decoration: const InputDecoration(labelText: 'Buscar nome', suffixIcon: Icon(Icons.search_outlined),),
                            onChanged: (value) {
                              // setState(() {
                              //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                ),
                sortColumnIndex: 0,
                source: RowSource(
                  context: context,
                  myData: controller.myData,
                  count: controller.myData.length,
                  controller: controller
                ),
                actions: [
                  SizedBox(height: 50, width: 50, child: cInkWell(50, 52, Icons.add, null, Get.theme.primaryColor, Colors.green, 'Novo Registro', () => saveUsuarioDialog(context, controller))),
                ],
                rowsPerPage: 10,
                columnSpacing: 2,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("Nome", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),    
                  DataColumn(label: Text("telefone", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),    
                  DataColumn(label: Text("endereco", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),), 
                  DataColumn(label: Text('',),),    
                ],
              ),
            )),
          ],
        ),
      )
    );
  }
}