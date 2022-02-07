import 'package:flutter/material.dart';
import 'package:quick_wait_android/design_system/alert/Alerts.dart';

class HealthPlan extends StatelessWidget {
  String title;
  HealthPlan({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            height: 46.0,
            decoration: BoxDecoration(
              color: const Color(0xFF12A1A7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: const Icon(Icons.cancel),
                    onTap: () {
                      showAlertDialog(context, "Deletar Banco",
                          "Deseja confirmar a exclusão?");
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
