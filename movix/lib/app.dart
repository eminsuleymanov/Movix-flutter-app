import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubits/category/cubit/category_cubit.dart';
import 'cubits/movie/cubit/movie_cubit.dart';
import 'presentation/screens/home/home_screen.dart';
import 'utils/constants/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MovieCubit()..getMovies()),
          BlocProvider(create: (context) => CategoryCubit()..getCategories()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.appTheme,
            home: const HomeScreen()),
      ),
    );
  }
}
