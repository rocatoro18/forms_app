import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    // SAFE AREA MUESTRA LOS WIDGETS SIN ESTORBOS COMO NOTCH,
    // DINAMYC ISLAND, CONTROLES DE MOVIEMINETO, ETC
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //const FlutterLogo(size: 500),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              const SizedBox(height: 20),
              FilledButton.tonalIcon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('Crear Usuario')),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
