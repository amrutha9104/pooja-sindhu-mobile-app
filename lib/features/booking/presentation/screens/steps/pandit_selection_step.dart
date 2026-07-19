import 'package:flutter/material.dart';
import 'package:pooja_sindhu/shared/widgets/app_primary_button.dart';

/// Temporary bridge until the pandit catalogue feature is available.
class PanditSelectionStep extends StatelessWidget {
  const PanditSelectionStep({super.key, required this.ritualId, required this.onPanditSelected});
  final String ritualId;
  final void Function(String panditId, String panditName) onPanditSelected;

  @override
  Widget build(BuildContext context) => Center(
        child: AppPrimaryButton(
          label: 'Use Test Pandit',
          fullWidth: false,
          onPressed: () => onPanditSelected('test-pandit-id', 'Test Pandit'),
        ),
      );
}
