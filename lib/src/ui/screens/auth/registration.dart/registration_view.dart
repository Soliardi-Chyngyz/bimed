import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/utils/preference/preference.dart';
import 'package:bimed/src/data/db/db_helper.dart';
import 'package:bimed/src/data/model/auth_response_model/reg_response_model.dart';
import 'package:bimed/src/data/repositories/auth_repository_impl.dart';
import 'package:bimed/src/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:bimed/src/ui/screens/auth/registration.dart/success_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../data/db/db_user.dart';
import '../../../../data/model/auth_model/auth_models.dart';

class RegistrationPage extends HookWidget {
  RegistrationPage(this.codeIso, this.phoneN, this.codeCountry, {Key? key}) : super(key: key);
  static const routeName = '/RegistrationScreen';

  String? codeCountry;
  String? phoneN;
  String? codeIso;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameFocusMode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _birthdayFocusMode = FocusNode();

  final AuthModelMutable model = AuthModelMutable(phone: '', birthday: '');


  void _saveForm(BuildContext context, ValueNotifier<bool> isLoading) {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) return;

    _formKey.currentState?.save();

    context.read<AuthBloc>().add(AuthRegister(AuthModel(
        phone: '$codeCountry$phoneN',
        birthday: model.birthday,
        lastName: model.surname ?? '',
        firstName: model.name ?? '')));
    isLoading.value = true;
  }

  void _showDatePicker(BuildContext context,
      TextEditingController editingController, ValueNotifier valueNotifier) {
    final currentYear = DateTime.now().year;
    valueNotifier.value = true;
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                String date = DateFormat("dd.MM.yyyy").format(value);
                model.birthday = date;
                editingController.text = date;
              },
              initialDateTime: DateTime(1980, 1, 1),
              minimumYear: 1900,
              maximumYear: currentYear,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    final isLoading = useValueNotifier(false);
    final isColorChange = useValueNotifier(false);
    final birthdayController = useTextEditingController();

    useEffect(() {
      return () {
        _formKey.currentState?.dispose();
      };
    });

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          switch (state.status) {
            case AuthStatus.done:
              isLoading.value = false;
              DBHelper.removeData();
              final model = state.responseValue as RegisterResponseModel;
              Prefs().setToken(model.token!);
              await DBUser.insertUser({
                'id': int.parse(model.user!.phone!),
                'firstName': model.user?.firstName ?? '',
                'phone': model.user?.phone ?? '',
                'whatsAppPhone': model.user?.whatsAppPhone ?? '',
                'address': model.user?.address ?? '',
                'email': model.user?.email ?? '',
                'codeIso': codeIso ?? '',
                'partOfNumber': phoneN ?? '',
                'countryCode': codeCountry ?? ''
              });

              Navigator.of(context).popAndPushNamed(SuccessPage.routeName);
              break;
            case AuthStatus.unknown:
              isLoading.value = false;
              break;
            case AuthStatus.error:
              isLoading.value = false;
              showSnackBar(context, state.error ?? 'пустая ошибка');
              break;
          }
        },
        child: Scaffold(
            appBar: const CustomAppBar(),
            body: LayoutBuilder(
              builder: (p0, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Регистрация',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Есть аккаунт?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: secondaryGray,
                                        )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: TextButton(
                                      onPressed: (() =>
                                          Navigator.of(context).pop()),
                                      child: const Text('Войти')),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Spacer(),
                            Form(
                                key: _formKey,
                                child: Column(children: [
                                  IntlPhoneField(
                                    initialValue: phoneN,
                                    decoration: CommonStyle.textFieldStyle(
                                        labelTextStr: 'Номер телефона'),
                                    onSubmitted: (_) => FocusScope.of(context)
                                        .requestFocus(_nameFocusMode),
                                    onChanged: (phone) {
                                      model.phone = phone.completeNumber;
                                      phoneN = phone.number;
                                    },
                                    invalidNumberMessage:
                                        'Неправильно введен номер',
                                    // ignore: deprecated_member_use
                                    searchText: 'Поиск страны',
                                    initialCountryCode:
                                        codeIso ?? 'KG',
                                    onCountryChanged: (country) {
                                        codeIso = country.dialCode;
                                        codeCountry = country.code;
                                    }
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    decoration: CommonStyle.textFieldStyle(
                                        labelTextStr: 'Имя'),
                                    autocorrect: false,
                                    onChanged: (v) => model.name = v,
                                    focusNode: _nameFocusMode,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context)
                                            .requestFocus(_surnameFocusNode),
                                    autofocus: true,
                                    validator: (value) {
                                      if (value != null) if (value.isEmpty) {
                                        return 'Пожалуйста заполните имя';
                                      }
                                      return null; // null - no error!
                                    },
                                    onSaved: (value) => model.name = value,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    autocorrect: false,
                                    decoration: CommonStyle.textFieldStyle(
                                        labelTextStr: 'Фамилия'),
                                    onChanged: (v) => model.surname,
                                    keyboardType: TextInputType.name,
                                    autofocus: true,
                                    focusNode: _surnameFocusNode,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context)
                                            .requestFocus(_birthdayFocusMode),
                                    validator: (value) {
                                      return null;
                                    },
                                    onSaved: (value) => model.surname = value,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  HookBuilder(builder: (context) {
                                    final isChangeColor =
                                        useValueListenable(isColorChange);

                                    return TextFormField(
                                      controller: birthdayController,
                                      onTap: () => _showDatePicker(context,
                                          birthdayController, isColorChange),
                                      autocorrect: false,
                                      decoration: CommonStyle.textFieldStyle(
                                        labelTextStr: 'Дата рождения',
                                        icon: Icon(
                                            Icons.calendar_month_outlined,
                                            color: isChangeColor
                                                ? lightBlue
                                                : secondaryGray),
                                      ),
                                      keyboardType: TextInputType.none,
                                      autofocus: true,
                                      textInputAction: TextInputAction.none,
                                      validator: (value) {
                                        // ignore: curly_braces_in_flow_control_structures
                                        if (value != null) if (value.isEmpty) {
                                          return 'Заполните данные';
                                        }
                                        return null;
                                      },
                                    );
                                  }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: HookBuilder(
                                      builder: (context) {
                                        final isProgress =
                                            useValueListenable(isLoading);
                                        return ElevatedButton(
                                            onPressed: () => isProgress
                                                ? null
                                                : _saveForm(context, isLoading),
                                            child: isProgress
                                                ? const CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 1.5,
                                                  )
                                                : const Text(
                                                    'Зарегистрироваться'));
                                      },
                                    ),
                                  ),
                                ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
