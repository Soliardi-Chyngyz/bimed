import 'package:bimed/src/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../../navigation_bar/nav_bar.dart';

class SuccessPage extends HookWidget {
  const SuccessPage({Key? key}) : super(key: key);
  static const routeName = '/successView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('asset/icons/success.svg'),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Вы успешно зарегистрировались',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: titleColor),
              ),
              const SizedBox(height: 24),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            NavBar.routeName, (route) => false);
                      },
                      child: const Text('На главную')))
            ],
          ),
        ),
      ),
    );
  }
}
