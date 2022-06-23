
import 'package:bimed/src/core/block/base_state.dart';

class SearchTextFieldEvent extends BaseEvent {
  const SearchTextFieldEvent(String value) : super(model: value);
}