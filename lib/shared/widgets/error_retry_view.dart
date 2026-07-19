import 'package:flutter/material.dart';
import 'package:pooja_sindhu/core/theme/app_colors.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';
import 'package:pooja_sindhu/shared/widgets/app_primary_button.dart';
class ErrorRetryView extends StatelessWidget { const ErrorRetryView({super.key, required this.message, required this.onRetry}); final String message; final VoidCallback onRetry; @override Widget build(BuildContext context) => Center(child: Padding(padding: const EdgeInsets.all(AppSpacing.xxl), child: Column(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.error_outline, size: 56, color: AppColors.error), const SizedBox(height: AppSpacing.lg), Text(message, textAlign: TextAlign.center), const SizedBox(height: AppSpacing.xl), AppPrimaryButton(label: 'Try Again', onPressed: onRetry, fullWidth: false)]))); }
