// build --delete-conflicting-outputs
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@Freezed()
class AuthResponseModel with _$AuthResponseModel {
  factory AuthResponseModel({
    required String message,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
