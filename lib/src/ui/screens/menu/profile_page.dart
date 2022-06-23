import 'dart:io';
import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/resources/strings.dart';
import 'package:bimed/src/data/model/auth_model/auth_models.dart';
import 'package:bimed/src/data/model/menu_profile/profile_model.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_bloc.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:phone_number/phone_number.dart';

import '../../../core/widgets/app_bar.dart';

class ProfilePage extends HookWidget {
  ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/ProfilePage';

  final _formKey = GlobalKey<FormState>();

  final AuthModelMutable model = AuthModelMutable(phone: '', birthday: '');
  final phoneMap = {'countryCode': '', 'number': ''};

  final _nameFocusMode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _thirdFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var itemList = ["Мужской", "Женский"];
    final sexType = useValueNotifier(itemList[0]);
    final isColorChange = useValueNotifier(false);
    final btnCondition = useValueNotifier(false);
    final storedImage = useValueNotifier(File(''));

    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    final thirdNameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final birthdayController = useTextEditingController();

    var firstRequest = true;

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
                  // model.birthday = date;
                  editingController.text = date;
                },
                initialDateTime: DateTime(1980, 1, 1),
                minimumYear: 1900,
                maximumYear: currentYear,
              ),
            );
          });
    }

    void _onBtnAvailability() {
      btnCondition.value = _formKey.currentState?.validate() ?? false;
    }

    void saveForm(BuildContext context) {
      final isValid = _formKey.currentState?.validate();
      if (!isValid!) return;
      _formKey.currentState?.save();

      var phone = '';
      if (phoneMap['countryCode']?.isEmpty ?? false) {
        phone = model.phone;
      } else {
        phone = '${phoneMap['countryCode']}${phoneMap['number']}';
      }

      EasyLoading.show();
      context.read<MenuBloc>().add(ChangeProfile(ProfileModel(
          name: model.name!.trim(),
          birthday: birthdayController.text,
          phone: phone,
          gender: model.sex,
          surname: model.surname!.trim())));
    }

    void condition() {
      if (nameController.text.isNotEmpty &&
          surnameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          birthdayController.text.isNotEmpty) {
        btnCondition.value = true;
      } else {
        btnCondition.value = false;
      }
    }

    Future<void> _takePicture(ImageSource imageSource) async {
      Navigator.of(context).pop();
      final imageFile =
          await ImagePicker().pickImage(source: imageSource, maxWidth: 600);

      if (imageFile == null) return;
      final pictureFile = File(imageFile.path);
      storedImage.value = pictureFile;
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final fileName = path.basename(pictureFile.path);
      final savedImage = await pictureFile.copy('${appDir.path}/$fileName');
      EasyLoading.show();
      context.read<MenuBloc>().add(SetAvatar(savedImage));
    }

    void _choosePicture() {
      if (Platform.isAndroid) {
        showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            //this right here
            child: SizedBox(
              height: 150.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    Strings.makeChoose,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => _takePicture(ImageSource.camera),
                          child: const Text(Strings.takePhoto),
                        ),
                        TextButton(
                          onPressed: () => _takePicture(ImageSource.gallery),
                          child: const Text(Strings.selectPhoto),
                        ),
                      ])
                ],
              ),
            ),
          ),
        );
      } else {
        showCupertinoDialog(
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text(Strings.makeChoose),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => _takePicture(ImageSource.camera),
                      child: const Text(Strings.takePhoto),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => _takePicture(ImageSource.gallery),
                      child: const Text(Strings.selectPhoto),
                    ),
                  ],
                ),
            context: context);
      }
    }

    void responseParsing(ProfileModel profileModel) async {
      nameController.text = profileModel.name;
      surnameController.text = profileModel.surname;
      model.phone = profileModel.phone;

      final PhoneNumber phoneNumber =
          await PhoneNumberUtil().parse(profileModel.phone);
      final number = phoneNumber.nationalNumber;
      phoneController.text = number;
      phoneMap['number'] = number;

      birthdayController.text = profileModel.birthday;
      String gender;
      if (profileModel.gender == 'male') {
        gender = 'Мужской';
      } else {
        gender = 'Женский';
      }
      sexType.value = gender;
    }

    useEffect(() {
      context.read<MenuBloc>().add(const GetProfile());
      nameController.addListener(() {
        condition();
      });
      surnameController.addListener(() {
        condition();
      });
      phoneController.addListener(() {
        condition();
      });
      birthdayController.addListener(() {
        condition();
      });

      return null;
    });

    return BlocConsumer<MenuBloc, BaseState>(listener: (context, state) {
      switch (state.status) {
        case Status.loading:
          break;
        case Status.done:
          if (state.responseValue is ProfileModel) {
            if (firstRequest) {
              firstRequest = false;
            } else {
              Navigator.of(context).pop();
            }
          }
          break;
        case Status.error:
          showSnackBar(context, state.error?.message ?? 'ошибка');
          break;
      }
    }, builder: (context, state) {
      ProfileModel? profileModel;
      if (state.responseValue is ProfileModel) {
        profileModel = state.responseValue as ProfileModel;
        responseParsing(state.responseValue as ProfileModel);
      }

      return Scaffold(
        appBar: const CustomAppBar(
          title: 'Профиль',
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(bottom: 0, left: 16, right: 16, top: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(children: [
                  HookBuilder(builder: (_) {
                    final img = useValueListenable(storedImage);
                    return ClipOval(
                      child: Image(
                          fit: BoxFit.cover,
                          width: 158,
                          height: 158,
                          // placeholder: const AssetImage('asset/user.png'),
                          image: img.path.isEmpty
                              ? NetworkImage(profileModel?.avatar ??
                                  'https://st.depositphotos.com/2000885/1902/i/600/depositphotos_19021343-stock-photo-red-heart.jpg')
                              : FileImage(img) as ImageProvider),
                    );
                  }),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: GestureDetector(
                      onTap: () => _choosePicture(),
                      child: SvgPicture.asset(
                        'asset/icons/edit.svg',
                        semanticsLabel: 'avatar-edit',
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Как к Вам обращаться?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: titleColor,
                      )),
                ),
                const SizedBox(height: 12),
                Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: nameController,
                        decoration:
                            CommonStyle.textFieldStyle(labelTextStr: 'Имя'),
                        autocorrect: false,
                        onChanged: (v) => model.name = v.trim(),
                        focusNode: _nameFocusMode,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(_surnameFocusNode),
                        autofocus: true,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Пожалуйста заполните имя';
                          }
                          return null; // null - no error!
                        },
                        onSaved: (value) => model.name = value?.trim(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: surnameController,
                        decoration:
                            CommonStyle.textFieldStyle(labelTextStr: 'Фамилие'),
                        autocorrect: false,
                        onChanged: (v) => model.surname = v.trim(),
                        focusNode: _surnameFocusNode,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(_thirdFocusNode),
                        autofocus: true,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Пожалуйста заполните';
                          }
                          return null;
                        },
                        onSaved: (value) => model.surname = value?.trim(),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: CommonStyle.textFieldStyle(
                            labelTextStr: 'Отчество'),
                        autocorrect: false,
                        onChanged: (v) => model.thirdName = v,
                        focusNode: _thirdFocusNode,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        validator: (value) {
                          return null;
                        },
                        onSaved: (value) => model.thirdName = value,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      HookBuilder(
                        builder: (context) {
                          final sex = useValueListenable(sexType);
                          return DropdownButtonFormField(
                              decoration: CommonStyle.textFieldStyle(),
                              value: sex,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: itemList.map((e) {
                                return DropdownMenuItem(
                                    value: e, child: Text(e));
                              }).toList(),
                              onChanged: (v) {
                                sexType.value = v.toString();
                                if (v.toString() == 'Мужской') {
                                  model.sex = Sex.male.name;
                                } else {
                                  model.sex = Sex.female.name;
                                }
                              });
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      IntlPhoneField(
                          controller: phoneController,
                          initialValue: profileModel?.phone,
                          decoration: CommonStyle.textFieldStyle(
                              labelTextStr: 'Номер телефона'),
                          onChanged: (phone) {
                            phoneMap['number'] = phone.number;
                            model.phone = phone.completeNumber;
                          },
                          invalidNumberMessage: 'Неправильно введен номер',
                          // ignore: deprecated_member_use
                          searchText: 'Поиск страны',
                          onCountryChanged: (country) {
                            phoneMap['countryCode'] = '+${country.dialCode}';
                          }),
                      HookBuilder(builder: (context) {
                        final isChangeColor = useValueListenable(isColorChange);

                        return TextFormField(
                          controller: birthdayController,
                          onTap: () => _showDatePicker(
                              context, birthdayController, isColorChange),
                          autocorrect: false,
                          decoration: CommonStyle.textFieldStyle(
                            labelTextStr: 'Дата рождения',
                            icon: Icon(Icons.calendar_month_outlined,
                                color:
                                    isChangeColor ? lightBlue : secondaryGray),
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
                        height: 12,
                      ),
                      HookBuilder(
                        builder: (_) {
                          final isClickable = useValueListenable(btnCondition);
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () =>
                                    isClickable ? saveForm(context) : null,
                                style: ElevatedButton.styleFrom(
                                  primary: isClickable ? blue : secondaryGray,
                                ),
                                child: const Text(
                                  'Сохранить',
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ])),
              ],
            ),
          ),
        ),
      );
    });
  }
}
