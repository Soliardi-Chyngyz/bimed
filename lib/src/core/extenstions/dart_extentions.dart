import 'package:intl/intl.dart';

String? separatedPrice(int? price) {
  if (price == null) return null;
  if (price.toString().length >= 4) {
    return NumberFormat('###,000', 'fr').format(price);
  } else {
    return price.toString();
  }
}