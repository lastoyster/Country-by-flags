// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_register_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormRegisterUser _$FormRegisterUserFromJson(Map<String, dynamic> json) {
  return _FormRegisterUser.fromJson(json);
}

/// @nodoc
mixin _$FormRegisterUser {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormRegisterUserCopyWith<FormRegisterUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormRegisterUserCopyWith<$Res> {
  factory $FormRegisterUserCopyWith(
          FormRegisterUser value, $Res Function(FormRegisterUser) then) =
      _$FormRegisterUserCopyWithImpl<$Res, FormRegisterUser>;
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class _$FormRegisterUserCopyWithImpl<$Res, $Val extends FormRegisterUser>
    implements $FormRegisterUserCopyWith<$Res> {
  _$FormRegisterUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormRegisterUserImplCopyWith<$Res>
    implements $FormRegisterUserCopyWith<$Res> {
  factory _$$FormRegisterUserImplCopyWith(_$FormRegisterUserImpl value,
          $Res Function(_$FormRegisterUserImpl) then) =
      __$$FormRegisterUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String fullName});
}

/// @nodoc
class __$$FormRegisterUserImplCopyWithImpl<$Res>
    extends _$FormRegisterUserCopyWithImpl<$Res, _$FormRegisterUserImpl>
    implements _$$FormRegisterUserImplCopyWith<$Res> {
  __$$FormRegisterUserImplCopyWithImpl(_$FormRegisterUserImpl _value,
      $Res Function(_$FormRegisterUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
  }) {
    return _then(_$FormRegisterUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FormRegisterUserImpl extends _FormRegisterUser {
  const _$FormRegisterUserImpl(
      {required this.email, required this.password, required this.fullName})
      : super._();

  factory _$FormRegisterUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormRegisterUserImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;

  @override
  String toString() {
    return 'FormRegisterUser(email: $email, password: $password, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormRegisterUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormRegisterUserImplCopyWith<_$FormRegisterUserImpl> get copyWith =>
      __$$FormRegisterUserImplCopyWithImpl<_$FormRegisterUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormRegisterUserImplToJson(
      this,
    );
  }
}

abstract class _FormRegisterUser extends FormRegisterUser {
  const factory _FormRegisterUser(
      {required final String email,
      required final String password,
      required final String fullName}) = _$FormRegisterUserImpl;
  const _FormRegisterUser._() : super._();

  factory _FormRegisterUser.fromJson(Map<String, dynamic> json) =
      _$FormRegisterUserImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$FormRegisterUserImplCopyWith<_$FormRegisterUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
