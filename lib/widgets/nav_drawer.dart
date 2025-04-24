import 'package:flutter/material.dart';
import 'package:govdesign_system/gov_design_system.dart';

/// Widget para um item de navegação padrão do gov.br
class GovDrawerItem extends StatelessWidget {
  /// Texto exibido
  final String title;

  /// Ícone exibido antes do texto
  final IconData icon;

  /// Callback ao tocar
  final VoidCallback onTap;

  const GovDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(
        title,
        style: AppTheme.textTheme.bodyLarge,
      ),
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
    );
  }
}

/// Drawer customizado baseado no Design System gov.br
class GovNavigationDrawer extends StatelessWidget {
  /// Widget opcional no topo do drawer
  final Widget? header;

  /// Altura do header em pixels
  final double headerHeight;

  /// Lista de widgets que serão exibidos no drawer
  final List<Widget> items;

  const GovNavigationDrawer({
    super.key,
    this.header,
    this.headerHeight = 120.0,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> drawerContent = [];

    if (header != null) {
      drawerContent.add(
        Container(
          height: headerHeight,
          width: double.infinity,
          color: AppTheme.primaryColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: header,
        ),
      );
      drawerContent.add(Divider(height: 1, color: Colors.grey.shade300));
    }

    drawerContent.add(
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: items,
        ),
      ),
    );

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: drawerContent,
      ),
    );
  }
}
