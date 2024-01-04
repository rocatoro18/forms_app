import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Cubit submit: $state');
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
        username: username,
        // SE MANDAN TODOS LOS CAMPOS, PARA SABER SI ES VALIDO O NO EL
        // FORMULARIO
        isValid: Formz.validate([username, state.password])));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        // SE MANDAN TODOS LOS CAMPOS, PARA SABER SI ES VALIDO O NO EL
        // FORMULARIO
        isValid: Formz.validate([password, state.username])));
  }
}
