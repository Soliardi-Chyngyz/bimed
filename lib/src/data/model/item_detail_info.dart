
import 'package:bimed/src/data/model/favorite/favorite_model.dart';

class ItemDetailModel {
  int? id;
  String? productType;
  String? name;
  List<Category>? category;
  String? releaseForm;
  String? description;
  bool? byPrescription;
  String? composition;
  String? instructions;
  int? limit;
  int? price;
  Country? country;
  Manufacturer? manufacturer;
  Brand? brand;
  String? createdAt;
  bool? outOfStock;
  List<Images>? images;
  List<String>? buyWithProduct;
  List<ItemModel>? similarProducts;
  List<String>? productInDrugstore;

  ItemDetailModel(
      {this.id,
        this.productType,
        this.name,
        this.category,
        this.releaseForm,
        this.description,
        this.byPrescription,
        this.composition,
        this.instructions,
        this.limit,
        this.price,
        this.country,
        this.manufacturer,
        this.brand,
        this.createdAt,
        this.outOfStock,
        this.images,
        this.buyWithProduct,
        this.similarProducts,
        this.productInDrugstore});

  ItemDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    name = json['name'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    releaseForm = json['release_form'];
    description = json['description'];
    byPrescription = json['by_prescription'];
    composition = json['composition'];
    instructions = json['instructions'];
    limit = json['limit'];
    price = json['price'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
    manufacturer = json['manufacturer'] != null
        ? Manufacturer.fromJson(json['manufacturer'])
        : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    createdAt = json['created_at'];
    outOfStock = json['out_of_stock'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['buy_with_product'] != null) {
      buyWithProduct = json['buy_with_product'].cast<String>();
    }
    if (json['product_in_drugstore'] != null) {
      productInDrugstore = json['product_in_drugstore'].cast<String?>();
    }
    if (json['similar_products'] != null) {
      similarProducts = <ItemModel>[];
      json['similar_products'].forEach((v) {
        similarProducts!.add(ItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['name'] = name;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    data['release_form'] = releaseForm;
    data['description'] = description;
    data['by_prescription'] = byPrescription;
    data['composition'] = composition;
    data['instructions'] = instructions;
    data['limit'] = limit;
    data['price'] = price;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (manufacturer != null) {
      data['manufacturer'] = manufacturer!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['created_at'] = createdAt;
    data['out_of_stock'] = outOfStock;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['buy_with_product'] = buyWithProduct;
    if (similarProducts != null) {
      data['similar_products'] =
          similarProducts!.map((v) => v.toJson()).toList();
    }
    data['product_in_drugstore'] = productInDrugstore;
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? oneCCountryId;

  Country({this.id, this.name, this.oneCCountryId});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    oneCCountryId = json['one_c_country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['one_c_country_id'] = oneCCountryId;
    return data;
  }
}

class Manufacturer {
  int? id;
  String? name;
  String? oneCManufacturerId;

  Manufacturer({this.id, this.name, this.oneCManufacturerId});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    oneCManufacturerId = json['one_c_manufacturer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['one_c_manufacturer_id'] = oneCManufacturerId;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? oneCBrandId;

  Brand({this.id, this.name, this.oneCBrandId});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    oneCBrandId = json['one_c_brand_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['one_c_brand_id'] = oneCBrandId;
    return data;
  }
}

class Images {
  int? id;
  String? image;
  bool? isLogo;

  Images({this.id, this.image, this.isLogo});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isLogo = json['is_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['is_logo'] = isLogo;
    return data;
  }
}

/*
class SimilarProducts {
  int? id;
  String? name;
  List<Images>? image;
  int? price;
  Null? inCard;
  Null? countInCard;
  Null? inFavorite;
  bool? byPrescription;
  String? productType;

  SimilarProducts(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.inCard,
        this.countInCard,
        this.inFavorite,
        this.byPrescription,
        this.productType});

  SimilarProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['image'] != null) {
      image = <Images>[];
      json['image'].forEach((v) {
        image!.add(Images.fromJson(v));
      });
    }
    price = json['price'];
    inCard = json['in_card'];
    countInCard = json['count_in_card'];
    inFavorite = json['in_favorite'];
    byPrescription = json['by_prescription'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['in_card'] = inCard;
    data['count_in_card'] = countInCard;
    data['in_favorite'] = inFavorite;
    data['by_prescription'] = byPrescription;
    data['product_type'] = productType;
    return data;
  }
}*/
