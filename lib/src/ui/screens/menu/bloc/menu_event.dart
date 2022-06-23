
import 'package:bimed/src/data/model/menu_profile/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class MenuEvent<T> extends Equatable {
  final T? model;
  const MenuEvent({this.model});

  @override
  List<Object?> get props => [model];
}

class GetProfile extends MenuEvent {
  const GetProfile() : super();
}

class ChangeProfile extends MenuEvent {
  const ChangeProfile(ProfileModel model) : super(model: model);
}

class SetAvatar extends MenuEvent {
  const SetAvatar(model) : super(model: model);
}

class GetFavoriteItems extends MenuEvent {
  const GetFavoriteItems([bool isShowProgress = true]) : super(model: isShowProgress);
}

class RemoveFavorite extends MenuEvent {
  const RemoveFavorite(Map<String, dynamic> map) : super(model: map);
}
