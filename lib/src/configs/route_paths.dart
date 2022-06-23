import 'package:flutter/material.dart';

enum AppRoutes {
  profile,
  favorite,
  orderHistory,
  branches,
  news,
  aboutCompany,
  help,
  contacts,

  auth,
  confirmation,
  registration,

  category,
  result,
  itemDetail,
  order,

  notifications,
}

class NavItemModel {
  String label;
  IconData icon;
  NavItemModel(this.label, this.icon);
}