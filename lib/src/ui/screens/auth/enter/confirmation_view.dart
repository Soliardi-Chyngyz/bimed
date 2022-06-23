import 'dart:async';
import 'package:bimed/src/configs/di/injector.dart';
import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/resources/strings.dart';
import 'package:bimed/src/core/utils/preference/preference.dart';
import 'package:bimed/src/data/db/db_helper.dart';
import 'package:bimed/src/data/db/db_user.dart';
import 'package:bimed/src/data/model/auth_confirm_model/auth_confirm.dart';
import 'package:bimed/src/data/model/auth_response_model/reg_response_model.dart';
import 'package:bimed/src/data/repositories/auth_repository_impl.dart';
import 'package:bimed/src/ui/blocs/confirm_cubit.dart';
import 'package:bimed/src/ui/navigation_bar/nav_bar.dart';
import 'package:bimed/src/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/widgets/app_bar.dart';

// ignore: must_be_immutable
class ConfirmationPage extends HookWidget {
  ConfirmationPage(this.codeCountry, this.number, {this.codeIso, Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String? codeCountry;
  String? number;
  String? codeIso;

  String? smsCode;
  String? fullPhoneNumber;

  _smsConfirm(BuildContext context) {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null) if (!isValid) return;
    _formKey.currentState?.save();

    EasyLoading.show();
    context.read<AuthBloc>().add(AuthConfirm(
        AuthConfirmModel(confirmCode: smsCode!, phone: fullPhoneNumber!)));
  }

  _smsRequest(String number, BuildContext context) {
    context.read<AuthBloc>().add(GetSmsCode(number));
  }

  @override
  Widget build(BuildContext context) {
    fullPhoneNumber = '$codeCountry$number';
    final receivedNumber = (number ?? '').replaceAllMapped(
        RegExp(r'(\d{3})(\d{3})(\d+)'),
        (Match m) => "(${m[1]}) ${m[2]} ${m[3]}");

    useEffect(() {
      _smsRequest(fullPhoneNumber!, context);
      return null;
    });

    return SafeArea(
      child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            switch (state.status) {
              case AuthStatus.done:
                if (state.responseValue is String) {
                  showSnackBar(context, state.responseValue as String);
                } else if (state.responseValue is RegisterResponseModel) {
                  final model = state.responseValue as RegisterResponseModel;
                  EasyLoading.showSuccess('успешно');
                  DBHelper.removeData();
                  final id = int.parse(model.user!.phone!.substring(1));
                  await DBUser.insertUser({
                    'id': id,
                    'firstName': model.user?.firstName ?? '',
                    'phone': model.user?.phone ?? '',
                    'whatsAppPhone': model.user?.whatsAppPhone ?? '',
                    'address': model.user?.address ?? '',
                    'email': model.user?.email ?? '',
                    'codeIso': codeIso ?? '',
                    'partOfNumber': number ?? '',
                    'countryCode': codeCountry ?? ''
                  });
                  Prefs().setToken(model.token!);

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      NavBar.routeName, (route) => false);
                }
                break;
              case AuthStatus.unknown:
                if (state is RegisterResponseModel) {
                  EasyLoading.dismiss();
                }
                break;
              case AuthStatus.error:
                EasyLoading.showError(state.error?.message);
                showSnackBar(context, state.error?.message ?? 'пустая ошибка');
                break;
            }
          },
          child: Scaffold(
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Подтверждение номера телефона',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$codeCountry $receivedNumber',
                            style: Theme.of(context).textTheme.headline2),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Неверный номер телефона?',
                                style: TextStyle(
                                    color: blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          autofocus: true,
                          onChanged: (v) => smsCode = v,
                          decoration: CommonStyle.textFieldStyle(
                              labelTextStr: 'Введите код подтверждения'),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            // ignore: curly_braces_in_flow_control_structures
                            if (value != null) if (value.isEmpty) {
                              return 'Пожалуйста заполните поле';
                            } else if (value.length != 6) {
                              return '6 значное число';
                            }
                            return null; // null - no error!
                          },
                          onSaved: (value) => smsCode = value,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => _smsConfirm(context),
                                child: const Text(Strings.confirm))),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: const Text('Не пришло SMS сообщение?')),
                        const SizedBox(height: 6),
                        CountDownTimerWidget(
                            () => _smsRequest(fullPhoneNumber ?? '', context)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class CountDownTimerWidget extends HookWidget {
  Function smsRequest;

  CountDownTimerWidget(this.smsRequest, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? _timer;

    final _isClickable = useValueNotifier(false);
    final _start = useValueNotifier(60);

    void startTimer() {
      const oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          if (_start.value == 0) {
            _isClickable.value = true;
            timer.cancel();
          } else {
            _start.value--;
          }
        },
      );
    }

    void onCDTclicked() {
      if (_isClickable.value) {
        if (_timer != null) {
          _timer?.cancel();
          _start.value = 60;
        }
        smsRequest();
        startTimer();
        _isClickable.value = false;
      }
    }

    useEffect(() {
      if (!_isClickable.value) {
        startTimer();
        return () {
          _timer?.cancel();
        };
      }
      return null;
    });

    return Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: 288,
            child: HookBuilder(builder: (_) {
              final timer = useValueListenable(_start);
              final isClickable = useValueListenable(_isClickable);
              return OutlinedButton(
                  onPressed: onCDTclicked,
                  child: Text(
                    'Отправить снова через: $timer',
                    style: TextStyle(
                        color: isClickable
                            ? secondaryGray
                            : secondaryGray.withOpacity(0.5)),
                  ));
            })));
  }
}
