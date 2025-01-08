import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'cubits/category/cubit/category_cubit.dart';
import 'cubits/locale/locale_cubit.dart';
import 'cubits/login/cubit/login_cubit.dart';
import 'cubits/movie/cubit/movie_cubit.dart';
import 'cubits/register/register_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'cubits/wishlist/wishlist_cubit.dart';
import 'presentation/screens/splash/splash_screen.dart';
import 'utils/constants/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final localeBox = Hive.box('locale');
    final savedCode = localeBox.get('userLocale', defaultValue: 'en') as String;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => MovieCubit()
                  ..getMovies()
                  ..getTrendingMovies()),
            BlocProvider(create: (context) => CategoryCubit()..getCategories()),
            BlocProvider(create: (context) => WishlistCubit()),
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => RegisterCubit()),
            BlocProvider(create: (context) => UserCubit()..fetchUserData()),
            BlocProvider(
                create: (context) =>
                    LocaleCubit()..changeLocale(Locale(savedCode))),
          ],
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppThemes.appTheme,
                locale: state.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                home: const SplashScreen(),
              );
            },
          )),
    );
  }
}
