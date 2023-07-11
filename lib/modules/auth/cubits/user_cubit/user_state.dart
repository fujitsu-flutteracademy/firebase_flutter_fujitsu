part of 'user_cubit.dart';

enum FormUserState { initial, loading, success, fail }

class UserState {
  final String nombre;
  final String uid;
  final String email;
  String? errorMessage;
  final FormUserState formUserState;
  final List<String> aficiones;

  UserState({
    required this.nombre,
    required this.uid,
    required this.email,
    required this.aficiones,
    required this.formUserState,
    this.errorMessage,
  });

  factory UserState.initial() {
    return UserState(
      nombre: '',
      uid: '',
      email: '',
      aficiones: ['Soy la primera aficción'],
      formUserState: FormUserState.initial,
    );
  }

  UserState copyWith({
    String? nombre,
    String? uid,
    String? email,
    String? errorMessage,
    FormUserState? formUserState,
    List<String>? aficiones,
  }) {
    return UserState(
      nombre: nombre ?? this.nombre,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      aficiones: aficiones ?? this.aficiones,
      errorMessage: errorMessage ?? this.errorMessage,
      formUserState: formUserState ?? this.formUserState,
    );
  }
}
