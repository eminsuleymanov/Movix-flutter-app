import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movix/app.dart';
import 'package:movix/data/models/movie.dart';
import 'package:movix/utils/constants/app_strings.dart';

import 'data/models/wishlist_movie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WishlistMovieAdapter());
  await Hive.openBox<WishlistMovie>(AppStrings.wishlist); 
  runApp(const App());
}
