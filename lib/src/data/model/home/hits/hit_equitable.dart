import 'package:equatable/equatable.dart';

import '../../favorite/favorite_model.dart';

class HitEquitable extends Equatable {
  final int count;
  final String? previous;
  final String? next;
  final int? numPage;
  final List<ItemModel> results;

  const HitEquitable(
      this.count, this.results, this.previous, this.next, this.numPage);

  @override
  List<Object?> get props {
    return [
      count, previous, next, numPage, results
    ];
  }

  @override
  bool get stringify => true;
}
