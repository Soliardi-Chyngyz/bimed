
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_model.freezed.dart';
part 'image_model.g.dart';

@JsonSerializable(explicitToJson: true)
@freezed
class ImageModel with _$ImageModel {
  factory ImageModel({
    int? id,
    @JsonKey(name: 'is_logo') bool? isLogo,
    String? image
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}