import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(locale: const Locale('en')));

  Future<void> changeLocale(Locale newLocale) async {
    final localeBox = Hive.box('locale');
    localeBox.put('userLocale', newLocale.languageCode);

    emit(LocaleState(locale: newLocale));
  }
}