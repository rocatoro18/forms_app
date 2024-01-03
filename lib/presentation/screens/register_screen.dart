import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

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
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  // CON ESTO TENGO EL CONTROL DE TODO EL FORMULARIO BASADO EN EL KEY
  final GlobalKey<FormState> _formKey = GlobalKey();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChange: (value) => username = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) return 'Mas de 6 letras';
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
                label: 'Correo electrónico',
                onChange: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegExp.hasMatch(value)) {
                    return 'No tiene formato de correo';
                  }
                  return null;
                }),
            const SizedBox(height: 20),
            CustomTextFormField(
                label: 'Contraseña',
                obscureText: true,
                onChange: (value) => password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  if (value.length < 6) return 'Mas de 6 letras';
                  return null;
                }),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
                onPressed: () {
                  // HACER LAS VALIDACIONES DEL FORMULARIO
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) return;
                  //print('$username, $email, $password');
                },
                icon: const Icon(Icons.save),
                label: const Text('Crear Usuario'))
          ],
        ));
  }
}
