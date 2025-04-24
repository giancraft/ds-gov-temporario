import 'package:flutter/material.dart';

/// Um AppBar customizado baseado no Design System do gov.br.
/// Mostra um título padrão estilizado, mas permite substituir por qualquer widget.
class GovAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Widget opcional que aparece na lateral esquerda (por exemplo, logotipo ou botão de menu)
  final Widget? leading;

  /// Título como texto simples. Ignorado se [titleWidget] for usado.
  final String? title;

  /// Widget totalmente customizável para o título. Se definido, sobrescreve [title].
  final Widget? titleWidget;

  /// Widgets opcionais exibidos na lateral direita (por exemplo, ícones de ação)
  final List<Widget>? actions;

  /// Centraliza o título horizontalmente
  final bool centerTitle;

  const GovAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleWidget,
    this.actions,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      titleSpacing: leading != null ? 0 : NavigationToolbar.kMiddleSpacing,
      leading: leading == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: leading,
            ),
      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                )
              : null),

      centerTitle: centerTitle,
      actions: actions,
      elevation: theme.appBarTheme.elevation,
      backgroundColor: theme.appBarTheme.backgroundColor,
    );
  }
}
