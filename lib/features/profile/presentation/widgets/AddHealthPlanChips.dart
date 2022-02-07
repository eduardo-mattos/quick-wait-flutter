import 'package:flutter/material.dart';
import 'package:quick_wait_android/features/profile/presentation/widgets/HealthPlanAdd.dart';

class AddHealthPlanChips extends StatefulWidget {
  const AddHealthPlanChips({Key? key}) : super(key: key);

  @override
  _AddHealthPlanChipsState createState() => _AddHealthPlanChipsState();
}

class _AddHealthPlanChipsState extends State<AddHealthPlanChips> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submit() {}

  void _openBankAddModal(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.95),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return HealthPlanAdd(formKey: _formKey, onSubmit: _submit);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: 142.0,
          height: 46.0,
          decoration: BoxDecoration(
            color: const Color(0xFF12A1A7),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xFF12A1A7),
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Novo Plano',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onTap: () {
                    _openBankAddModal(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
