import 'package:equatable/equatable.dart';

import 'image_model.dart';

class ItemM extends Equatable {
  final int? id;
  final String name;
  final String? image;
  final int? price;
  final bool? inCart;
  final int? countInCart;
  final bool? inFavorite;
  final bool byPrescription;
  final String productType;

  const ItemM(
      {this.id,
      required this.name,
      required this.productType,
      required this.byPrescription,
      this.inFavorite,
      this.countInCart,
      this.inCart,
      this.image,
      this.price});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      price,
      inCart,
      countInCart,
      inFavorite,
      byPrescription,
      productType
    ];
  }

  @override
  bool get stringify => true;
}
