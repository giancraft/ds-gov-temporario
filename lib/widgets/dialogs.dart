import 'package:flutter/material.dart';
import '../theme.dart';

class CustomDialogs {
  static Future<void> showTitleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            title: _buildDialogTitle(context, "Título do Diálogo", null),
            content: _buildDialogContent(context),
            actions: _buildDialogActions(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
    );
  }

  static Future<void> showIconTitleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            title: _buildDialogTitle(
              context,
              "Aviso Importante",
              Icons.warning,
            ),
            content: _buildDialogContent(context),
            actions: _buildDialogActions(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
    );
  }

  static Future<void> showSimpleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogContent(context),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildDialogActions(context),
                ),
              ],
            ),
          ),
    );
  }

  // Métodos auxiliares
  static Widget _buildDialogTitle(
    BuildContext context,
    String text,
    IconData? icon,
  ) {
    return Row(
      children: [
        if (icon != null)
          Icon(icon, color: Theme.of(context).primary60, size: 24),
        if (icon != null) const SizedBox(width: 12),
        Text(text, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }

  static Widget _buildDialogContent(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  static List<Widget> _buildDialogActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          "CANCELAR",
          style: TextStyle(color: Theme.of(context).primary60),
        ),
      ),
      const SizedBox(width: 8),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          "CONFIRMAR",
          style: TextStyle(color: Theme.of(context).primary60),
        ),
      ),
    ];
  }
}
