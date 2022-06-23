
class OrderModel {
  int? id;
  User? user;
  String? name;
  String? email;
  String? phone;
  String? whatsappPhone;
  String? address;
  String? comment;
  int? paymentType;
  String? totalPrice;
  String? discountAmount;
  String? paidPoints;
  String? accruedPoints;
  OrderItem? orderItem;

  OrderModel(
      {this.id,
        this.user,
        this.name,
        this.email,
        this.phone,
        this.whatsappPhone,
        this.address,
        this.comment,
        this.paymentType = 0,
        this.totalPrice,
        this.discountAmount,
        this.paidPoints,
        this.orderItem,
        this.accruedPoints});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    orderItem = json['order_item'] != null ? OrderItem.fromJson(json['order_item']) : null;
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    whatsappPhone = json['whatsapp_phone'];
    address = json['address'];
    comment = json['comment'];
    paymentType = json['payment_type'];
    totalPrice = json['total_price'];
    discountAmount = json['discount_amount'];
    paidPoints = json['paid_points'];
    accruedPoints = json['accrued_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (orderItem != null) {
      data['order_item'] = orderItem!.toJson();
    }
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['whatsapp_phone'] = whatsappPhone;
    data['address'] = address;
    data['comment'] = comment;
    data['payment_type'] = paymentType;
    data['total_price'] = totalPrice;
    data['discount_amount'] = discountAmount;
    data['paid_points'] = paidPoints;
    data['accrued_points'] = accruedPoints;
    return data;
  }
}

class OrderItem {
  int? product;
  int? nums;

  OrderItem({this.product, this.nums});

  OrderItem.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    nums = json['nums'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    data['nums'] = nums;
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? phone;
  String? whatsAppPhone;
  String? gender;
  String? address;
  String? birthday;
  String? email;
  String? points;
  String? avatar;
  String? qrKey;
  String? qrCodeFile;
  String? userType;
  String? getUserTypeDisplay;
  bool? isRegistrationFinish;
  bool? isBlock;
  String? saleEndDate;
  Sale? sale;
  String? codeIso;
  String? phoneN;
  String? countryCode;

  User(
      {this.firstName,
        this.lastName,
        this.phone,
        this.whatsAppPhone,
        this.gender,
        this.address,
        this.birthday,
        this.email,
        this.points,
        this.avatar,
        this.qrKey,
        this.qrCodeFile,
        this.userType,
        this.getUserTypeDisplay,
        this.isRegistrationFinish,
        this.isBlock,
        this.saleEndDate,
        this.phoneN,
        this.codeIso,
        this.countryCode,
        this.sale});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    whatsAppPhone = json['whats_app_phone'];
    gender = json['gender'];
    address = json['address'];
    birthday = json['birthday'];
    email = json['email'];
    points = json['points'];
    avatar = json['avatar'];
    qrKey = json['qr_key'];
    qrCodeFile = json['qr_code_file'];
    userType = json['user_type'];
    getUserTypeDisplay = json['get_user_type_display'];
    isRegistrationFinish = json['is_registration_finish'];
    isBlock = json['is_block'];
    saleEndDate = json['sale_end_date'];
    sale = json['sale'] != null ? Sale.fromJson(json['sale']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['whats_app_phone'] = whatsAppPhone;
    data['gender'] = gender;
    data['address'] = address;
    data['birthday'] = birthday;
    data['email'] = email;
    data['points'] = points;
    data['avatar'] = avatar;
    data['qr_key'] = qrKey;
    data['qr_code_file'] = qrCodeFile;
    data['user_type'] = userType;
    data['get_user_type_display'] = getUserTypeDisplay;
    data['is_registration_finish'] = isRegistrationFinish;
    data['is_block'] = isBlock;
    data['sale_end_date'] = saleEndDate;
    if (sale != null) {
      data['sale'] = sale!.toJson();
    }
    return data;
  }
}

class Sale {
  int? discount;
  int? cashback;

  Sale({this.discount, this.cashback});

  Sale.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    cashback = json['cashback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount'] = discount;
    data['cashback'] = cashback;
    return data;
  }
}