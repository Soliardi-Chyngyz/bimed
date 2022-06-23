class RegisterResponseModel {
  String? _message;
  String? _token;
  bool? _isProfileCompleted;
  User? _user;

  RegisterResponseModel(
      {String? message, String? token, bool? isProfileCompleted, User? user}) {
    if (message != null) {
      this._message = message;
    }
    if (token != null) {
      this._token = token;
    }
    if (isProfileCompleted != null) {
      this._isProfileCompleted = isProfileCompleted;
    }
    if (user != null) {
      this._user = user;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  String? get token => _token;
  set token(String? token) => _token = token;
  bool? get isProfileCompleted => _isProfileCompleted;
  set isProfileCompleted(bool? isProfileCompleted) =>
      _isProfileCompleted = isProfileCompleted;
  User? get user => _user;
  set user(User? user) => _user = user;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _token = json['token'];
    _isProfileCompleted = json['is_profile_completed'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['token'] = this._token;
    data['is_profile_completed'] = this._isProfileCompleted;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _whatsAppPhone;
  String? _gender;
  String? _address;
  String? _birthday;
  String? _email;
  String? _points;
  String? _avatar;
  String? _qrKey;
  String? _qrCodeFile;
  String? _userType;
  String? _getUserTypeDisplay;
  bool? _isRegistrationFinish;
  bool? _isBlock;
  String? _saleEndDate;
  Sale? _sale;

  User(
      {String? firstName,
      String? lastName,
      String? phone,
      String? whatsAppPhone,
      String? gender,
      String? address,
      String? birthday,
      String? email,
      String? points,
      String? avatar,
      String? qrKey,
      String? qrCodeFile,
      String? userType,
      String? getUserTypeDisplay,
      bool? isRegistrationFinish,
      bool? isBlockString,
      String? saleEndDate,
      Sale? sale}) {
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (whatsAppPhone != null) {
      this._whatsAppPhone = whatsAppPhone;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (address != null) {
      this._address = address;
    }
    if (birthday != null) {
      this._birthday = birthday;
    }
    if (email != null) {
      this._email = email;
    }
    if (points != null) {
      this._points = points;
    }
    if (avatar != null) {
      this._avatar = avatar;
    }
    if (qrKey != null) {
      this._qrKey = qrKey;
    }
    if (qrCodeFile != null) {
      this._qrCodeFile = qrCodeFile;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (getUserTypeDisplay != null) {
      this._getUserTypeDisplay = getUserTypeDisplay;
    }
    if (isRegistrationFinish != null) {
      this._isRegistrationFinish = isRegistrationFinish;
    }
    if (isBlock != null) {
      this._isBlock = isBlock;
    }
    if (saleEndDate != null) {
      this._saleEndDate = saleEndDate;
    }
    if (sale != null) {
      this._sale = sale;
    }
  }

  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get whatsAppPhone => _whatsAppPhone;
  set whatsAppPhone(String? whatsAppPhone) => _whatsAppPhone = whatsAppPhone;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get birthday => _birthday;
  set birthday(String? birthday) => _birthday = birthday;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get points => _points;
  set points(String? points) => _points = points;
  String? get avatar => _avatar;
  set avatar(String? avatar) => _avatar = avatar;
  String? get qrKey => _qrKey;
  set qrKey(String? qrKey) => _qrKey = qrKey;
  String? get qrCodeFile => _qrCodeFile;
  set qrCodeFile(String? qrCodeFile) => _qrCodeFile = qrCodeFile;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get getUserTypeDisplay => _getUserTypeDisplay;
  set getUserTypeDisplay(String? getUserTypeDisplay) =>
      _getUserTypeDisplay = getUserTypeDisplay;
  bool? get isRegistrationFinish => _isRegistrationFinish;
  set isRegistrationFinish(bool? isRegistrationFinish) =>
      _isRegistrationFinish = isRegistrationFinish;
  bool? get isBlock => _isBlock;
  set isBlock(bool? isBlock) => _isBlock = isBlock;
  String? get saleEndDate => _saleEndDate;
  set saleEndDate(String? saleEndDate) => _saleEndDate = saleEndDate;
  Sale? get sale => _sale;
  set sale(Sale? sale) => _sale = sale;

  User.fromJson(Map<String, dynamic> json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _whatsAppPhone = json['whats_app_phone'];
    _gender = json['gender'];
    _address = json['address'];
    _birthday = json['birthday'];
    _email = json['email'];
    _points = json['points'];
    _avatar = json['avatar'];
    _qrKey = json['qr_key'];
    _qrCodeFile = json['qr_code_file'];
    _userType = json['user_type'];
    _getUserTypeDisplay = json['get_user_type_display'];
    _isRegistrationFinish = json['is_registration_finish'];
    _isBlock = json['is_block'];
    _saleEndDate = json['sale_end_date'];
    _sale = json['sale'] != null ? new Sale.fromJson(json['sale']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['phone'] = this._phone;
    data['whats_app_phone'] = this._whatsAppPhone;
    data['gender'] = this._gender;
    data['address'] = this._address;
    data['birthday'] = this._birthday;
    data['email'] = this._email;
    data['points'] = this._points;
    data['avatar'] = this._avatar;
    data['qr_key'] = this._qrKey;
    data['qr_code_file'] = this._qrCodeFile;
    data['user_type'] = this._userType;
    data['get_user_type_display'] = this._getUserTypeDisplay;
    data['is_registration_finish'] = this._isRegistrationFinish;
    data['is_block'] = this._isBlock;
    data['sale_end_date'] = this._saleEndDate;
    if (this._sale != null) {
      data['sale'] = this._sale!.toJson();
    }
    return data;
  }
}

class Sale {
  int? _discount;
  int? _cashback;

  Sale({int? discount, int? cashback}) {
    if (discount != null) {
      this._discount = discount;
    }
    if (cashback != null) {
      this._cashback = cashback;
    }
  }

  int? get discount => _discount;
  set discount(int? discount) => _discount = discount;
  int? get cashback => _cashback;
  set cashback(int? cashback) => _cashback = cashback;

  Sale.fromJson(Map<String, dynamic> json) {
    _discount = json['discount'];
    _cashback = json['cashback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this._discount;
    data['cashback'] = this._cashback;
    return data;
  }
}
