part of usuario_screen;

void saveUsuarioDialog(BuildContext context, UsuarioController controller) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(child: Text("Novo Usuario", style: Get.theme.textTheme.titleLarge)),
      content: SizedBox(
        width: 350,
        child: SaveUsuarioForm(controller: controller,),
      ),
    )
  );
}

class SaveUsuarioForm extends StatefulWidget {

  final UsuarioController controller;
  
  const SaveUsuarioForm({Key? key, required this.controller,}) : super(key: key);

  @override
  State<SaveUsuarioForm> createState() => _SaveUsuarioFormState();
}

class _SaveUsuarioFormState extends State<SaveUsuarioForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeC = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _endereco = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nomeC,
              decoration: const InputDecoration(labelText: 'Nome',),
            ),       
            TextFormField(
              controller: _telefone,
              decoration: const InputDecoration(labelText: 'Telefone',),
            ),
            TextFormField(
              controller: _endereco,
              decoration: const InputDecoration(labelText: 'Endereco',),
            ),
            Center(
              child: TextButton(
                child: const Icon(Icons.add, color: Colors.green), 
                onPressed: () {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    widget.controller.saveItem(UsuarioModel(id: null, nome: _nomeC.text, telefone: _telefone.text, endereco:  _endereco.text));                 
                  }
                },
              ),
            ),                   
          ],
        ),
      ),
    );
  }
}