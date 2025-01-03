import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'data/models/wishlist_movie.dart';
import 'utils/constants/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Firebase.initializeApp();
  Hive.registerAdapter(WishlistMovieAdapter());
  await Hive.openBox<WishlistMovie>(AppStrings.wishlist);
  await Hive.openBox('auth');
  await Hive.openBox('locale');

  runApp(const App());
}
