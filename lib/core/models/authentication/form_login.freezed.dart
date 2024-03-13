// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormLogin _$FormLoginFromJson(Map<String, dynamic> json) {
  return _FormLogin.fromJson(json);
}

/// @nodoc
mixin _$FormLogin {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormLoginCopyWith<FormLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormLoginCopyWith<$Res> {
  factory $FormLoginCopyWith(FormLogin value, $Res Function(FormLogin) then) =
      _$FormLoginCopyWithImpl<$Res, FormLogin>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$FormLoginCopyWithImpl<$Res, $Val extends FormLogin>
    implements $FormLoginCopyWith<$Res> {
  _$FormLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormLoginImplCopyWith<$Res>
    implements $FormLoginCopyWith<$Res> {
  factory _$$FormLoginImplCopyWith(
          _$FormLoginImpl value, $Res Function(_$FormLoginImpl) then) =
      __$$FormLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$FormLoginImplCopyWithImpl<$Res>
    extends _$FormLoginCopyWithImpl<$Res, _$FormLoginImpl>
    implements _$$FormLoginImplCopyWith<$Res> {
  __$$FormLoginImplCopyWithImpl(
      _$FormLoginImpl _value, $Res Function(_$FormLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$FormLoginImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FormLoginImpl extends _FormLogin {
  const _$FormLoginImpl({required this.email, required this.password})
      : super._();

  factory _$FormLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormLoginImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'FormLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormLoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormLoginImplCopyWith<_$FormLoginImpl> get copyWith =>
      __$$FormLoginImplCopyWithImpl<_$FormLoginImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormLoginImplToJson(
      this,
    );
  }
}

abstract class _FormLogin extends FormLogin {
  const factory _FormLogin(
      {required final String email,
      required final String password}) = _$FormLoginImpl;
  const _FormLogin._() : super._();

  factory _FormLogin.fromJson(Map<String, dynamic> json) =
      _$FormLoginImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$FormLoginImplCopyWith<_$FormLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
