import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class InfoBadge extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const InfoBadge({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTextStyles.badgeLabel,
        ),
      ],
    );
  }
}
