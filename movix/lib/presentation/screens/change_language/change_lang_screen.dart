import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/core/routes/generator.dart';
import 'package:movix/presentation/screens/home/home_view.dart';
import 'package:movix/utils/extensions/locale_extension.dart';
import 'widgets/lang_option.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/assets_paths.dart';

import '../../../cubits/locale/locale_cubit.dart';
import '../../../utils/constants/app_strings.dart';
import '../../widgets/custom_basic_appbar.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.read<LocaleCubit>();
    return Scaffold(
      appBar: CustomBasicAppbar(text: context.l10n.selectLanguage),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LangOption(
              language: AppStrings.english,
              imagePath: AssetsPaths.englishFlag,
              onTap: () {
                localeCubit.changeLocale(const Locale('en'));
                Navigate.back(context, const HomeView());

              },
            ),
            AppSizedboxes.h45,
            LangOption(
              language: AppStrings.russian,
              imagePath: AssetsPaths.russianFlag,
              onTap: () {
                localeCubit.changeLocale(const Locale('ru'));
                Navigate.back(context, const HomeView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
