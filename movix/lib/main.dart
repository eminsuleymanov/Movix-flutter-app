import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'data/models/wishlist_movie.dart';
import 'utils/constants/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WishlistMovieAdapter());
  // await Hive.deleteBoxFromDisk(AppStrings.wishlist);

  await Hive.openBox<WishlistMovie>(AppStrings.wishlist); 

  runApp(const App());
}
