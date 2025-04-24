import 'package:flutter/material.dart';
import '../theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool hasError;
  final bool isDisabled;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    this.hasError = false,
    this.isDisabled = false,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() => setState(() {});

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        focusNode: _focusNode,
        enabled: !widget.isDisabled,
        decoration: _buildDecoration(theme),
        onChanged: widget.onChanged,
      ),
    );
  }

  InputDecoration _buildDecoration(ThemeData theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: _getBorderColor(theme), width: 1.5),
    );

    return InputDecoration(
      labelText: widget.label,
      labelStyle: TextStyle(color: _getLabelColor(theme)),
      enabled: !widget.isDisabled,
      floatingLabelStyle: TextStyle(color: _getFloatingLabelColor(theme)),
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: _getFocusColor(theme), width: 2.0),
      ),
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: theme.secondary40, width: 2.0),
      ),
      errorText:
          widget.hasError ? widget.errorText ?? 'Campo obrigatório' : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  Color _getBorderColor(ThemeData theme) {
    if (widget.hasError) return theme.colorScheme.error;
    if (widget.isDisabled) return theme.primary20;
    if (_focusNode.hasFocus) return theme.primary60;
    if (_isHovered) return theme.primary40;
    return theme.primary20;
  }

  Color _getLabelColor(ThemeData theme) {
    if (widget.isDisabled) return theme.primary20;
    return theme.primary60;
  }

  Color _getFloatingLabelColor(ThemeData theme) {
    if (widget.hasError) return theme.colorScheme.error;
    return theme.primary60;
  }

  Color _getFocusColor(ThemeData theme) {
    return widget.hasError ? theme.secondary40 : theme.primary60;
  }
}
