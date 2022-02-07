import 'package:flutter/material.dart';
import 'package:quick_wait_android/design_system/app_bar/CustomAppBar.dart';

class _FormData {
  TextEditingController type = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController agency = TextEditingController();
  TextEditingController account = TextEditingController();
}

class HealthPlanAdd extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  const HealthPlanAdd({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  @override
  State<HealthPlanAdd> createState() => _HealthPlanAddState();
}

class _HealthPlanAddState extends State<HealthPlanAdd> with TickerProviderStateMixin {
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
    String dropdownValue = 'Banco do Brasil';

    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            CustomAppBar(
              title: "Adicionar Banco",
              isOnmodal: true,
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.grey,
              tabs: const <Widget>[
                Tab(
                  text: "Pix",
                  icon: Icon(Icons.money),
                ),
                Tab(
                  text: "TED",
                  icon: Icon(Icons.money),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: _size.width * 0.70,
              height: _size.height * 0.60,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Wrap(
                    children: [
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _form.account,
                          decoration: const InputDecoration(
                              hintText: 'Digite a chave',
                              labelText: 'Chave Pix')),
                    ],
                  ),
                  Wrap(
                    children: [
                      Center(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.grey),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Banco do Brasil',
                            'NuBank',
                            'Itaú',
                            'Bradesco',
                            'Caixa Econômica'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: _size.height * 0.1),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _form.account,
                          decoration: const InputDecoration(
                              hintText: 'Digite a agência',
                              labelText: 'Agência')),
                      SizedBox(height: _size.height * 0.03),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _form.account,
                        decoration: const InputDecoration(
                            hintText: 'Digite a conta', labelText: 'Conta'),
                      ),
                    ],
                  ),
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
                  'Adicionar',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Container(
              width: _size.width * 0.73,
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    enableFeedback: false,
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.grey))),
                onPressed: () {},
                child: const Text(
                  'Cancelar',
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
