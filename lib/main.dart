import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/router/app_router.dart';
import 'package:pooja_sindhu/core/theme/app_colors.dart';
import 'package:pooja_sindhu/core/theme/app_radius.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';
import 'package:pooja_sindhu/core/theme/app_typography.dart';
import 'package:pooja_sindhu/features/auth/data/repositories/auth_repository_provider.dart';

void main() {
  runApp(const ProviderScope(child: PoojaSindhuApp()));
}

class PoojaSindhuApp extends ConsumerStatefulWidget {
  const PoojaSindhuApp({super.key});

  @override
  ConsumerState<PoojaSindhuApp> createState() => _PoojaSindhuAppState();
}

class _PoojaSindhuAppState extends ConsumerState<PoojaSindhuApp> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(authRepositoryProvider).tryRestoreSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
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
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: AppTypography.textTheme,
        appBarTheme: const AppBarTheme(centerTitle: true),
        cardTheme: CardThemeData(
          color: AppColors.surfaceLight,
          margin: const EdgeInsets.all(AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
        ),
      ),
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('hi')],
    );
  }
}
