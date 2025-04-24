import 'package:flutter/material.dart';
import 'widgets/bottomNavBar.dart';
import 'widgets/textFields.dart';
import 'widgets/dialogs.dart';
import 'theme.dart';
import 'widgets/progressIndicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Gov',
      theme: AppTheme.themeData,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordsMatch = false;

  bool _isLoading = false;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sistema Design Gov",
          style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              _buildColorSection(theme),
              const Divider(height: 40, thickness: 1),
              _buildFormSection(theme),
              const Divider(height: 40, thickness: 1),
              _buildDialogSection(context),
              const Divider(height: 40, thickness: 1),
              _buildLoadingDemo(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: CustomBottomNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
              itemCount: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Indicador de Progresso Personalizado",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        _isLoading
            ? const CustomProgressIndicator(size: 36)
            : ElevatedButton(
              onPressed: () {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() => _isLoading = false);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primary60,
              ),
              child: const Text(
                "Simular Carregamento",
                style: TextStyle(color: Colors.white),
              ),
            ),
      ],
    );
  }

  Widget _buildDialogSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Componentes de Diálogo",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: [
            _buildDialogButton(
              context,
              "Simples",
              () => CustomDialogs.showTitleDialog(context),
            ),
            _buildDialogButton(
              context,
              "Com Ícone",
              () => CustomDialogs.showIconTitleDialog(context),
            ),
            _buildDialogButton(
              context,
              "Sem Título",
              () => CustomDialogs.showSimpleDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDialogButton(
    BuildContext context,
    String text,
    VoidCallback action,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primary60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: action,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildColorSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Paleta de Cores", style: theme.textTheme.headlineMedium),
        const SizedBox(height: 16),
        _ColorTile("Primary 90", theme.primary90),
        _ColorTile("Secondary 40", theme.secondary40),
        _ColorTile("Primary Container", theme.colorScheme.primaryContainer),
      ],
    );
  }

  Widget _buildFormSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Componentes de Formulário",
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        const CustomTextField(label: "Nome completo"),
        const SizedBox(height: 16),
        const CustomTextField(label: "E-mail profissional"),
        const SizedBox(height: 16),
        const CustomTextField(label: "CEP", isDisabled: true),
        const SizedBox(height: 16),
        CustomTextField(
          label: "Senha",
          controller: _passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: "Confirmação de senha",
          controller: _confirmPasswordController,
          obscureText: true,
          hasError:
              !_passwordsMatch && _confirmPasswordController.text.isNotEmpty,
          errorText: _passwordsMatch ? null : "As senhas não coincidem",
          onChanged:
              (value) => setState(() {
                _passwordsMatch = value == _passwordController.text;
              }),
        ),
      ],
    );
  }
}

class _ColorTile extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorTile(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),
          const SizedBox(width: 16),
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
