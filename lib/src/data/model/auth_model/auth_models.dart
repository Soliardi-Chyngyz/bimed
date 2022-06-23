import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    required String phone,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    required String birthday,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

class AuthModelMutable {
  String phone;
  String? name;
  String? surname;
  String birthday;

  String? thirdName;
  String sex;

  AuthModelMutable(
      {required this.phone,
      required this.birthday,
      this.name,
      this.surname,
      this.thirdName,
      this.sex = 'male'});
}

enum Sex {
  male,
  female,
}
