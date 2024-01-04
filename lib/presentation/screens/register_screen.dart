import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
          create: (context) => RegisterCubit(), child: const _RegisterView()),
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    // REFERENCIA AL CUBIT
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
        //key: _formKey,
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          //onChange: registerCubit.usernameChanged,
          onChange: (value) {
            registerCubit.usernameChanged(value);
            // CADA QUE LA PERSONA HACE UN CAMBIO EN EL INPUT, CON ESTA INSTRUCCION SE
            // VALIDA AUTOMATICAMENTE CADA UNO DE LOS CAMPOS
            //_formKey.currentState?.validate();
          },
          errorMessage: username.errorMessage,
          /*
          ESTE VALIDATOR NO SERA NECESARIO CON BLOC/CUBIT
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo requerido';
            if (value.trim().isEmpty) return 'Campo requerido';
            if (value.length < 6) return 'Mas de 6 letras';
            return null;
          },
          */
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Correo electrónico',
          onChange: (value) {
            registerCubit.emailChanged(value);
            // CADA QUE LA PERSONA HACE UN CAMBIO EN EL INPUT, CON ESTA INSTRUCCION SE
            // VALIDA AUTOMATICAMENTE CADA UNO DE LOS CAMPOS
            //_formKey.currentState?.validate();
          },
          errorMessage: email.errorMessage,
          /*
          ESTE VALIDATOR NO SERA NECESARIO CON BLOC/CUBIT
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
            }
            */
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          onChange: (value) {
            registerCubit.passwordChanged(value);
            // CADA QUE LA PERSONA HACE UN CAMBIO EN EL INPUT, CON ESTA INSTRUCCION SE
            // VALIDA AUTOMATICAMENTE CADA UNO DE LOS CAMPOS
            //_formKey.currentState?.validate();
          },
          errorMessage: password.errorMessage,
          /*
          ESTE VALIDATOR NO SERA NECESARIO CON BLOC/CUBIT
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Mas de 6 letras';
              return null;
            }*/
        ),
        const SizedBox(height: 20),
        FilledButton.tonalIcon(
            onPressed: () {
              // HACER LAS VALIDACIONES DEL FORMULARIO
              //final isValid = _formKey.currentState!.validate();
              //if (!isValid) return;
              //print('$username, $email, $password');
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'))
      ],
    ));
  }
}
