import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_confirm.freezed.dart';
part 'auth_confirm.g.dart';

@freezed
class AuthConfirmModel with _$AuthConfirmModel {
  factory AuthConfirmModel({
    required String phone,
    @JsonKey(name: 'confirmation_code') required String confirmCode,
  }) = _AuthConfirmModel;

  factory AuthConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$AuthConfirmModelFromJson(json);
}
