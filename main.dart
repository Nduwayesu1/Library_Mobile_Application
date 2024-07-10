import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:library_app/register.dart';
import 'package:library_app/update.dart';
import 'package:library_app/view_book.dart';
import 'package:library_app/settings.dart';
import 'package:library_app/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Library App',
            theme: themeProvider.themeData,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/settings': (context) => SettingsScreen(),
              '/registerBook': (context) => RegisterBookForm(),
              '/updateBook': (context) => UpdateForm(),
              '/viewBook': (context) => BookListScreen(),
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eBooks'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(size: 100),
                  SizedBox(height: 10),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Update Book'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/updateBook');
              },
            ),
            ListTile(
              leading: Icon(Icons.visibility),
              title: Text('View Book'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewBook');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 200),
              SizedBox(height: 20),
              Text(
                'Welcome to eBooks App',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/registerBook');
        },
      ),
    );
  }
}

