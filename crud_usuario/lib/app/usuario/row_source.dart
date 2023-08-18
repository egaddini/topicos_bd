part of usuario_screen;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  BuildContext context;
  UsuarioController controller;


  RowSource({
    required this.context,
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData[index], context, controller, index) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(UsuarioModel usuario, BuildContext context, UsuarioController controller, int index) {
  return DataRow(
    cells: [
      DataCell(Text(usuario.nome)),
      DataCell(Text(usuario.telefone)),
      DataCell(Text(usuario.endereco)),
      DataCell(SizedBox(height: 40, width: 40, child: cInkWell(22, 30, Icons.delete, Icons.delete_forever_outlined, Get.theme.primaryColor, Colors.red, 'Deletar', () => controller.deleteItem(index)))),        
    ],
  );
}

Widget cInkWell(double defaultWidith, double? hoverWidith, IconData defaultIcon, IconData? hoverIcon, Color defaultColor, Color? hoverColor, String message, Function function) {
  
  RxDouble dWidith = defaultWidith.obs;
  Rx<IconData> dIcon = defaultIcon.obs;
  Rx<Color> dColor = defaultColor.obs;
  
  
  return Obx(() => InkWell(
      borderRadius: BorderRadius.circular(90),
      onHover: (value) {
        if (hoverWidith != null) dWidith.value = value ? hoverWidith : defaultWidith;
        if (hoverIcon != null) dIcon.value = value ? hoverIcon : defaultIcon;
        if (hoverColor != null) dColor.value = value ? hoverColor : defaultColor;
      },
      onTap: () => function(),
      child: Tooltip(message: message, child: Icon(dIcon.value, size: dWidith.value, color: dColor.value)),
  ),);
}