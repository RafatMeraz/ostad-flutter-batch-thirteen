import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/providers/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return DropdownMenu<ThemeMode>(
          initialSelection: themeProvider.themeMode,
          dropdownMenuEntries: themeProvider.themeModes.map((l) {
            return DropdownMenuEntry<ThemeMode>(
              value: l,
              label: l.name.toUpperCase(),
            );
          }).toList(),
          onSelected: (ThemeMode? selectedThemeMode) {
            themeProvider.changeThemeMode(selectedThemeMode!);
          },
        );
      },
    );
  }
}
