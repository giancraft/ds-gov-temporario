import 'package:flutter/material.dart';
import 'package:govdesign_system/gov_design_system.dart';

/// Botões padrão do Design System gov.br

/// Botão principal (filled)
class GovPrimaryButton extends StatelessWidget {
  /// Conteúdo do botão (texto, ícone, etc.)
  final Widget child;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  /// Preenche a largura disponível
  final bool fullWidth;

  const GovPrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = ElevatedButton.styleFrom(
      backgroundColor: AppTheme.primaryColor,
      disabledBackgroundColor: theme.primary40,
      minimumSize: const Size(0, 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      textStyle: AppTheme.textTheme.labelLarge?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );

    final button = ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: style,
      child: child,
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}

/// Botão secundário (outlined)
class GovSecondaryButton extends StatelessWidget {
  /// Conteúdo do botão 
  final Widget child;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  /// Preenche a largura disponível
  final bool fullWidth;

  const GovSecondaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: AppTheme.primaryColor),
      disabledForegroundColor: theme.primary40,
      minimumSize: const Size(0, 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      textStyle: AppTheme.textTheme.labelLarge?.copyWith(
        color: AppTheme.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );

    final button = OutlinedButton(
      onPressed: disabled ? null : onPressed,
      style: style,
      child: child,
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}

/// Botão de texto (text button)
class GovTextButton extends StatelessWidget {
  /// Conteúdo do botão 
  final Widget child;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  /// Preenche a largura disponível
  final bool fullWidth;

  const GovTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 40),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        textStyle: AppTheme.textTheme.labelLarge?.copyWith(
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: child,
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}