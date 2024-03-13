import 'package:flags_app/core/models/authentication/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState({
    User? user,
  }) = _AuthenticationState;

  factory AuthenticationState.logout() => const AuthenticationState();

  bool get isLoggedIn => user != null;
}
