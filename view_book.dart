import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          constraints: BoxConstraints(maxWidth: 1200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 50.0, // Increase column spacing here
              columns: [
                DataColumn(label: Text('Title', style: TextStyle(color: Colors.black))),
                DataColumn(label: Text('Author', style: TextStyle(color: Colors.black))),
                DataColumn(label: Text('Publication Year', style: TextStyle(color: Colors.black))),
                DataColumn(label: Text('ISBN', style: TextStyle(color: Colors.black))),
              ],
              rows: [], // Empty list of rows
            ),
          ),
        ),
      ),
    );
  }
}
