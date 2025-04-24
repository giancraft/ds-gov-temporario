import 'package:flutter/material.dart';
import 'package:govdesign_system/gov_design_system.dart';

/// SnackBars padrão do Design System gov.br
class GovSnackBar {
  GovSnackBar._();

  static const double _borderRadius = 8.0;
  static const EdgeInsets _margin = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  /// Exibe um SnackBar informativo (padrão)
  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      message,
      backgroundColor: Theme.of(context).primary90,
      icon: Icons.info_outline,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  /// Exibe um SnackBar de sucesso
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message,
      backgroundColor: Theme.of(context).secondary05,
      icon: Icons.check_circle_outline,
      textColor: Theme.of(context).textMessage,
      iconColor: Theme.of(context).textMessage,
    );
  }

  /// Exibe um SnackBar de erro
  static void showError(BuildContext context, String message) {
    _show(
      context,
      message,
      backgroundColor: Theme.of(context).errorMessage,
      icon: Icons.error_outline,
      textColor: Theme.of(context).textMessage,
      iconColor: Theme.of(context).textMessage,
    );
  }

  static void _show(
    BuildContext context,
    String message, {
    required Color backgroundColor,
    required IconData icon,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      margin: _margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      content: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppTheme.textTheme.bodyMedium?.copyWith(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
