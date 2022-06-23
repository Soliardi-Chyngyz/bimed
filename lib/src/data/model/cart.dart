import 'package:bimed/src/data/model/favorite/favorite_model.dart';

class CartModel {
  int? id;
  int? user;
  int? totalAmountProduct;
  int? productCount;
  int? totalAmountCost;
  List<ItemModel>? product;

  CartModel(
      {this.id,
        this.user,
        this.totalAmountProduct,
        this.productCount,
        this.totalAmountCost,
        this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    totalAmountProduct = json['total_amount_product'];
    productCount = json['product_count'];
    if (json['product'] != null) {
      product = <ItemModel>[];
      json['product'].forEach((v) {
        product!.add(ItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['total_amount_product'] = totalAmountProduct;
    data['product_count'] = productCount;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
