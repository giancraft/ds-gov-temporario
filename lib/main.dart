import 'package:flutter/material.dart';
import 'package:govdesign_system/gov_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Theme',
      theme: AppTheme.themeData,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenha o tema da aplicação
    final theme = Theme.of(context);

    return Scaffold(
      appBar: GovAppBar(title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exemplo utilizando primaryContainer definido no ColorScheme
            Text(
              "Exemplo de primaryContainer:",
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Este container utiliza a cor primaryContainer',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Exemplo utilizando cores customizadas definidas na extensão CustomColors
            Text(
              "Exemplo de CustomColors:",
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:
                    theme
                        .primary90, // Usando a variação primary90 definida na extensão
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Container com primary90 (extensão CustomColors)',
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:
                    theme
                        .secondary40, // Usando a variação secondary40 definida na extensão
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Container com secondary40 (extensão CustomColors)',
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GovSnackBar.showInfo(context, 'Informação simples');
              },
              child: Text('Info'),
            ),

            ElevatedButton(
              onPressed: () {
                GovSnackBar.showSuccess(context, 'Operação bem-sucedida');
              },
              child: Text('Successo'),
            ),

            ElevatedButton(
              onPressed: () {
                GovSnackBar.showError(context, 'Algo deu errado');
              },
              child: Text('Erro'),
            ),
          ],
        ),
      ),
      drawer: GovNavigationDrawer(
        header: Container(color: Theme.of(context).primaryColor,),
        headerHeight: 80,
        items: [
          GovDrawerItem(title: 'Home', icon: Icons.home, onTap: () {}),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {},
          ),
          Container(padding: EdgeInsets.all(16), child: Text('Versão 1.0.0')),
        ],
      ),
    );
  }
}
