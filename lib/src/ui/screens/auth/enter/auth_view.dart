import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/route_paths.dart';
import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/ui/screens/auth/enter/confirmation_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/widgets/app_bar.dart';
import '../registration.dart/registration_view.dart';

enum AuthMode { Signup, Login }

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  const AuthPage({Key? key}) : super(key: key);

  @override
  _AutPageState createState() => _AutPageState();
}

class _AutPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? phoneNumber;
  String? codeCountry;
  String? codeIso;

  void enter() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null) if (!isValid) return;

    AppRouter.route(context: context, route: AppRoutes.confirmation, params: {
      'code': codeCountry,
      'phone': phoneNumber,
      'codeIso': codeIso,
    });
  }

  void _registration() {
    AppRouter.route(context: context, route: AppRoutes.registration, params: {
      'codeIso': codeIso,
      'phone': phoneNumber,
      'code': codeCountry ?? '+996'
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Вход',
                style: Theme.of(context).textTheme.headline1,
              ),
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: IntlPhoneField(
                        decoration: CommonStyle.textFieldStyle(
                            labelTextStr: 'Номер телефона'),
                        onChanged: (phone) {
                          phoneNumber = phone.number;
                          codeCountry = phone.countryCode;
                          codeIso = phone.countryISOCode;
                        },
                        invalidNumberMessage: 'Неправильно введен номер',
                        // ignore: deprecated_member_use
                        searchText: 'Поиск страны',
                        initialCountryCode: 'KG',
                        onCountryChanged: (country) {
                          codeIso = country.dialCode;
                          codeCountry = country.code;
                        },
                      )),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: enter, child: const Text('Войти')),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'или',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: _registration,
                        child: const Text('Зарегистрироваться'),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
