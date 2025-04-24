import 'package:flutter/material.dart';
import 'package:teste/widgets/app_bar.dart';
import 'package:teste/widgets/buttons.dart';
import 'theme.dart'; // Certifique-se de que o caminho está correto

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
      appBar: GovAppBar(
        title: 'Título da Página',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
        centerTitle: false,
      ),
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
            ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_back)),
            SizedBox(height: 20),
            GovPrimaryButton(child: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){}),
            SizedBox(height: 20),
            GovPrimaryButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Salvar', style: TextStyle(color: Colors.white),),
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            GovSecondaryButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            GovTextButton(child: Text('Link'), onPressed: () {}),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
