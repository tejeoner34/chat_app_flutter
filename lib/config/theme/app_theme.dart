import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF8b8bc9);
const Map<String, dynamic> _themeColors = {
  'custom': _customColor,
  'blue': Colors.blue,
  'red': Colors.red,
  'yellow': Colors.yellow,
  'green': Colors.green,
  'orange': Colors.orange
};

class AppTheme {
  final String selectedColor;

  AppTheme({this.selectedColor = 'custom'})
      : assert(_themeColors.containsKey(selectedColor), 'Color does not exist');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _themeColors[selectedColor]);
  }
}
