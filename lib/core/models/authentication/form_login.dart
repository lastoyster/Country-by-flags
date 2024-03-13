import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_login.freezed.dart';
part 'form_login.g.dart';

@freezed
class FormLogin with _$FormLogin {
  const FormLogin._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FormLogin({
    required String email,
    required String password,
  }) = _FormLogin;

  bool get isEmpty => email.isEmpty || password.isEmpty;

  factory FormLogin.fromJson(Map<String, dynamic> json) =>
      _$FormLoginFromJson(json);
}
