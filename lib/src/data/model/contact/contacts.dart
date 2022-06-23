

class Contacts {
  List<PrimaryPhone>? primaryPhone;
  List<PrimaryPhone>? phone;
  List<PrimaryPhone>? social;
  List<PrimaryPhone>? address;
  List<PrimaryPhone>? email;
  List<PrimaryPhone>? android;
  List<PrimaryPhone>? ios;

  Contacts(
      {this.primaryPhone,
        this.phone,
        this.social,
        this.address,
        this.email,
        this.android,
        this.ios});

  Contacts.fromJson(Map<String, dynamic> json) {

    if (json['primary_phone'] != null) {
      primaryPhone = <PrimaryPhone>[];
      json['primary_phone'].forEach((v) {
        primaryPhone!.add(PrimaryPhone.fromJson(v));
      });
    }
    if (json['phone'] != null) {
      phone = <PrimaryPhone>[];
      json['phone'].forEach((v) {
        phone!.add(PrimaryPhone.fromJson(v));
      });
    }
    if (json['social'] != null) {
      social = <PrimaryPhone>[];
      json['social'].forEach((v) {
        social!.add(PrimaryPhone.fromJson(v));
      });
    }
    if (json['address'] != null) {
      address = <PrimaryPhone>[];
      json['address'].forEach((v) {
        address!.add(PrimaryPhone.fromJson(v));
      });
    }
    if (json['email'] != null) {
      email = <PrimaryPhone>[];
      json['email'].forEach((v) {
        email!.add(PrimaryPhone.fromJson(v));
      });
    }
    if (json['android'] != null) {
      android = <PrimaryPhone>[];
      json['android'].forEach((v) {
        android!.add(PrimaryPhone.fromJson(v));
      });
    }
    if (json['ios'] != null) {
      ios = <PrimaryPhone>[];
      json['ios'].forEach((v) {
        ios!.add(PrimaryPhone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (primaryPhone != null) {
      data['primary_phone'] = primaryPhone!.map((v) => v.toJson()).toList();
    }
    if (phone != null) {
      data['phone'] = phone!.map((v) => v.toJson()).toList();
    }
    if (social != null) {
      data['social'] = social!.map((v) => v.toJson()).toList();
    }
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    if (email != null) {
      data['email'] = email!.map((v) => v.toJson()).toList();
    }
    if (android != null) {
      data['android'] = android!.map((v) => v.toJson()).toList();
    }
    if (ios != null) {
      data['ios'] = ios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrimaryPhone {
  int? id;
  String? name;
  String? image;
  String? link;

  PrimaryPhone({this.id, this.name, this.image, this.link});

  PrimaryPhone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['link'] = link;
    return data;
  }
}