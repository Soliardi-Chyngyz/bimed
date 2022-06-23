import 'package:freezed_annotation/freezed_annotation.dart';

part 'fav_post.freezed.dart';
part 'fav_post.g.dart';

@freezed
class FavoritePostModel with _$FavoritePostModel {

  factory FavoritePostModel({
    int? id,
    int? user,
    List<int>? product,
  }) = _FavoritePostModel;

  factory FavoritePostModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritePostModelFromJson(json);
}