import 'package:flags_app/core/models/authentication/form_login.dart';
import 'package:flags_app/core/models/authentication/form_register_user.dart';
import 'package:flags_app/core/models/authentication/user.dart';

class SubmitRegisterAction {
  final FormRegisterUser registerUser;

  const SubmitRegisterAction({
    required this.registerUser,
  });
}

class SubmitLoginAction {
  final FormLogin login;

  SubmitLoginAction({
    required this.login,
  });
}

class SetUserAction {
  final User user;

  const SetUserAction({
    required this.user,
  });
}

class LogoutAction {
  const LogoutAction();
}

class GetCurrentLoginAction {
  const GetCurrentLoginAction();
}

class SubmitForgotPasswordAction {
  final String email;

  const SubmitForgotPasswordAction(this.email);
}
