import 'package:freezed_annotation/freezed_annotation.dart';

part 'flag.freezed.dart';
part 'flag.g.dart';

@freezed
class Flag with _$Flag {
  const Flag._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Flag({
    required String name,
    required String flag,
    required String image,
    required String descriptions,
  }) = _Flag;

  factory Flag.fromJson(Map<String, dynamic> json) => _$FlagFromJson(json);
}
