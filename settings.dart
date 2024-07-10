import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:library_app/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            bool isDarkMode = themeProvider.isDarkMode;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Removed the 'Mode' text widget here
                SizedBox(height: 12.0),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  value: isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
