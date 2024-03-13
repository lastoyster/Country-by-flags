// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Flag _$FlagFromJson(Map<String, dynamic> json) {
  return _Flag.fromJson(json);
}

/// @nodoc
mixin _$Flag {
  String get name => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get descriptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlagCopyWith<Flag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagCopyWith<$Res> {
  factory $FlagCopyWith(Flag value, $Res Function(Flag) then) =
      _$FlagCopyWithImpl<$Res, Flag>;
  @useResult
  $Res call({String name, String flag, String image, String descriptions});
}

/// @nodoc
class _$FlagCopyWithImpl<$Res, $Val extends Flag>
    implements $FlagCopyWith<$Res> {
  _$FlagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flag = null,
    Object? image = null,
    Object? descriptions = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlagImplCopyWith<$Res> implements $FlagCopyWith<$Res> {
  factory _$$FlagImplCopyWith(
          _$FlagImpl value, $Res Function(_$FlagImpl) then) =
      __$$FlagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String flag, String image, String descriptions});
}

/// @nodoc
class __$$FlagImplCopyWithImpl<$Res>
    extends _$FlagCopyWithImpl<$Res, _$FlagImpl>
    implements _$$FlagImplCopyWith<$Res> {
  __$$FlagImplCopyWithImpl(_$FlagImpl _value, $Res Function(_$FlagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flag = null,
    Object? image = null,
    Object? descriptions = null,
  }) {
    return _then(_$FlagImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FlagImpl extends _Flag {
  const _$FlagImpl(
      {required this.name,
      required this.flag,
      required this.image,
      required this.descriptions})
      : super._();

  factory _$FlagImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlagImplFromJson(json);

  @override
  final String name;
  @override
  final String flag;
  @override
  final String image;
  @override
  final String descriptions;

  @override
  String toString() {
    return 'Flag(name: $name, flag: $flag, image: $image, descriptions: $descriptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlagImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, flag, image, descriptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlagImplCopyWith<_$FlagImpl> get copyWith =>
      __$$FlagImplCopyWithImpl<_$FlagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlagImplToJson(
      this,
    );
  }
}

abstract class _Flag extends Flag {
  const factory _Flag(
      {required final String name,
      required final String flag,
      required final String image,
      required final String descriptions}) = _$FlagImpl;
  const _Flag._() : super._();

  factory _Flag.fromJson(Map<String, dynamic> json) = _$FlagImpl.fromJson;

  @override
  String get name;
  @override
  String get flag;
  @override
  String get image;
  @override
  String get descriptions;
  @override
  @JsonKey(ignore: true)
  _$$FlagImplCopyWith<_$FlagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
