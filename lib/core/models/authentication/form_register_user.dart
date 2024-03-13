import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_register_user.freezed.dart';
part 'form_register_user.g.dart';

@freezed
class FormRegisterUser with _$FormRegisterUser {
  const FormRegisterUser._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FormRegisterUser({
    required String email,
    required String password,
    required String fullName,
  }) = _FormRegisterUser;

  bool get isEmpty => email.isEmpty || password.isEmpty || fullName.isEmpty;

  factory FormRegisterUser.fromJson(Map<String, dynamic> json) =>
      _$FormRegisterUserFromJson(json);
}
