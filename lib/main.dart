import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pooja_sindhu/core/router/app_router.dart';
import 'package:pooja_sindhu/core/theme/app_colors.dart';
import 'package:pooja_sindhu/core/theme/app_radius.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';
import 'package:pooja_sindhu/core/theme/app_typography.dart';

void main() {
  runApp(const PoojaSindhuApp());
}

class PoojaSindhuApp extends StatelessWidget {
  const PoojaSindhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pooja Sindhu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surfaceLight,
          background: AppColors.backgroundLight,
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: AppTypography.textTheme,
        appBarTheme: const AppBarTheme(centerTitle: true),
        cardTheme: CardTheme(
          color: AppColors.surfaceLight,
          margin: const EdgeInsets.all(AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
        ),
      ),
      routerConfig: appRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('hi')],
    );
  }
}

