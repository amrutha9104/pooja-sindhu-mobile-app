import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pooja_sindhu/core/constants/route_constants.dart';
import 'package:pooja_sindhu/core/theme/app_colors.dart';
import 'package:pooja_sindhu/core/theme/app_spacing.dart';
import 'package:pooja_sindhu/shared/widgets/app_primary_button.dart';
import 'package:pooja_sindhu/shared/widgets/app_secondary_button.dart';
class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key, required this.bookingId});

  final String bookingId;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.success,
                  size: 80,
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  'Booking Confirmed!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Your booking has been confirmed. You will receive a notification shortly.',
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                AppPrimaryButton(
                  label: 'View My Bookings',
                  onPressed: () => context.go(Routes.myBookings),
                ),
                const SizedBox(height: AppSpacing.md),
                AppSecondaryButton(
                  label: 'Go to Home',
                  onPressed: () => context.go(Routes.home),
                ),
              ],
            ),
          ),
        ),
      );
}
