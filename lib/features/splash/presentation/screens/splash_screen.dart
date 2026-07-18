import 'package:flutter/material.dart';
import 'package:pooja_sindhu/core/theme/app_colors.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.temple_hindu, size: 72, color: AppColors.primary),
            SizedBox(height: AppSpacing.md),
            Text('Pooja Sindhu'),
            SizedBox(height: AppSpacing.xs),
            Text('Day 1 scaffold'),
          ],
        ),
      ),
    );
  }
}

