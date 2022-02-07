import 'package:flutter/material.dart';
import 'package:quick_wait_android/design_system/app_bar/CustomAppBar.dart';

class _FormData {
  TextEditingController type = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController agency = TextEditingController();
  TextEditingController account = TextEditingController();
}

class ProfileEdit extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  const ProfileEdit({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit>
    with TickerProviderStateMixin {
  final _FormData _form = _FormData();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            CustomAppBar(
              title: "Editar Perfil",
              isOnmodal: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: _size.width * 0.70,
              height: _size.height * 0.60,
              child: Wrap(
                children: [
                  SizedBox(height: _size.height * 0.1),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nome",
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: _size.height * 0.03),
                  InkWell(
                    onTap: () {
                      //_selectDate(); // Call Function that has showDatePicker()
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Nascimento', labelText: "Nascimento"),
                        maxLength: 10,
                        onSaved: (val) {},
                      ),
                    ),
                  ),
                  SizedBox(height: _size.height * 0.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Telefone",
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: _size.height * 0.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: _size.height * 0.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Cidade",
                    ),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: _size.height * 0.09),
                  DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text("Estado"),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {},
                    items: <String>[
                      'Acre',
                      'Alagoas',
                      'Amapá',
                      'Amazonas',
                      'Bahia',
                      'Ceará',
                      'Distrito Federal',
                      'Espírito Santo',
                      'Goiás',
                      'Maranhão',
                      'Mato Grosso',
                      'Mato Grosso do Sul',
                      'Minas Gerais',
                      'Pará',
                      'Paraíba',
                      'Paraná',
                      'Pernambuco',
                      'Piauí',
                      'Rio de Janeiro',
                      'Rio Grande do Norte',
                      'Rio Grande do Sul',
                      'Rondônia',
                      'Roraima',
                      'Santa Catarina',
                      'São Paulo',
                      'Sergipe',
                      'Tocantins'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            Container(
              width: _size.width * 0.73,
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  enableFeedback: false,
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
                onPressed: () {},
                child: const Text(
                  'Alterar',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
