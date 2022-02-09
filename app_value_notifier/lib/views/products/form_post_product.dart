import 'package:flutter/material.dart';

class FormPostProduct extends StatelessWidget {
  const FormPostProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
}
