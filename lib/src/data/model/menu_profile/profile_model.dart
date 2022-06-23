import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @JsonKey(name: 'first_name') required String name,
    @JsonKey(name: 'last_name') required String surname,
    required String gender,
    required String birthday,
    @JsonKey(name: 'whats_app_phone') required String phone,
    String? avatar,

    int? id,
    String? points,
    @JsonKey(name: 'qr_key') String? qrKey,
    @JsonKey(name: 'qr_code_file') String? qrPhoto,
    @JsonKey(name: 'unread_notifications_exists') @Default(false) bool unreadNotifExists,
    @JsonKey(name: 'unread_notifications_count') int? unreadNotifCount,
    String? email,
    String? address,
    @JsonKey(name: 'get_user_type_display') String? userTypeDisplay,
    @JsonKey(name: 'is_block') @Default(false) bool isBlock,

  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
