import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_model.freezed.dart';
part 'avatar_model.g.dart';

@Freezed()
class AvatarModel with _$AvatarModel {
  factory AvatarModel({required String avatar}) = _AvatarModel;

  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);
}