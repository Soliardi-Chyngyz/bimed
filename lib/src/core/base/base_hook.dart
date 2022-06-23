
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class BaseHook extends HookWidget {
  const BaseHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void request() {}

    useEffect(() {
      request();
      return null;
    });

    return Scaffold();
  }
}