import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/route_paths.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/data/model/menu_profile/profile_model.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_bloc.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_event.dart';
import 'package:bimed/src/ui/screens/qr/bloc/qr_bloc.dart';
import 'package:bimed/src/ui/screens/qr/bloc/qr_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/block/base_state.dart';
import '../../../core/utils/preference/preference.dart';

class QRScreen extends HookWidget {
  const QRScreen({Key? key}) : super(key: key);
  static const id = 'QRScreen';

  @override
  Widget build(BuildContext context) {
    var isAuth = useValueNotifier(false);

    void authConfirmation() async {
      isAuth.value = await Prefs().isAuthorized();
      if (isAuth.value) {
        // ignore: use_build_context_synchronously
        context.read<QrBloc>().add(const GetProfileEvent());
      }
    }

    useEffect(() {
      authConfirmation();
      return null;
    });

    return HookBuilder(
      builder: (context) {
        final auth = useValueListenable(isAuth);

        return Scaffold(
          body: auth
              ? BlocBuilder<QrBloc, BaseState>(
                  builder: (_, state) {
                    if (state.responseValue is ProfileModel) {
                      final data = state.responseValue as ProfileModel;

                      final points =
                          double.parse(data.points ?? '0').toInt().toString();

                      Prefs().setProductType(data.userTypeDisplay);

                      return
                          LayoutBuilder(builder: (p0, constraint) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: constraint.maxHeight),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  color: purpleDark),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        // TODO статус юзера иконка
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 12),
                                    child: Row(
                                      children: [
                                        Text(points,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                    color: green,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        SizedBox(
                                          width: 110,
                                          child: Text('Накопленных баллов',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(flex: 2,),
                                  Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 278,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: blue,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24),
                                                topRight: Radius.circular(24)))
                                      ),
                                      Positioned(
                                        bottom: 110,
                                        child: SizedBox(
                                          width: 340,
                                          height: 340,
                                          child: Card(
                                            color: lightBlue,
                                            elevation: 0,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      image: data.qrPhoto ?? '',
                                                      placeholder:
                                                          'asset/user.png',
                                                    ))),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 90),
                                        child: Text(
                                          'Покажите QR код для получения балла',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    }
                    return const SizedBox.shrink();
                  },
                )
              : buildCardAuthWidget(context),
        );
      },
    );
  }

  Center buildCardAuthWidget(
    BuildContext context,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  SvgPicture.asset('asset/icons/user.svg'),
                  const SizedBox(
                    height: 17,
                  ),
                  const SizedBox(
                    height: 46,
                    width: 200,
                    child: Text(
                      'Авторизуйтесь для получения QR кода',
                      style: TextStyle(
                          color: darkColor,
                          fontSize: 15.0,
                          height: 1.4,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          AppRouter.route(
                              context: context, route: AppRoutes.auth);
                        },
                        child: const Text('Войти')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
