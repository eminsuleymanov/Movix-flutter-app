import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/cubits/wishlist/wishlist_cubit.dart';

import 'cubits/category/cubit/category_cubit.dart';
import 'cubits/movie/cubit/movie_cubit.dart';
import 'presentation/screens/home/home_view.dart';
import 'utils/constants/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MovieCubit()..getMovies()..getTrendingMovies()),
          BlocProvider(create: (context) => CategoryCubit()..getCategories()),
          BlocProvider(create: (context)=> WishlistCubit())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.appTheme,
            home: const HomeView(),
            
            
            )
            

      ),
    );
  }
}
