import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterBookForm(),
    );
  }
}

class RegisterBookForm extends StatefulWidget {
  @override
  _RegisterBookFormState createState() => _RegisterBookFormState();
}

class _RegisterBookFormState extends State<RegisterBookForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _isbnController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _yearController.dispose();
    _isbnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register New Book'),
      ),
      backgroundColor: Colors.lightBlue[200], // Set background color to light blue
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal margin for spacing from screen edges
          constraints: BoxConstraints(maxWidth: 400), // Max width constraint
          decoration: BoxDecoration(
            color: Colors.lightBlue[200], // Same as background for consistent appearance
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Adjust main axis size to minimize the vertical space
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Register New Book',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Change font color to black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Book Title',
                        labelStyle: TextStyle(color: Colors.black), // Set label font color to black
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black), // Set border color to black
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.trim().isEmpty) {
                          return 'Please enter the book title';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black), // Set input text color to black
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _authorController,
                      decoration: InputDecoration(
                        labelText: 'Author Name',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.trim().isEmpty) {
                          return 'Please enter the author name';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _yearController,
                      decoration: InputDecoration(
                        labelText: 'Publication Year',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.trim().isEmpty) {
                          return 'Please enter the publication year';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _isbnController,
                      decoration: InputDecoration(
                        labelText: 'ISBN',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.trim().isEmpty) {
                          return 'Please enter the ISBN';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process the data (e.g., register new book)
                          // You can add your logic here to handle the registration
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Book registered successfully'),
                            ),
                          );
                          // Optionally, clear the form fields after registration
                          _titleController.clear();
                          _authorController.clear();
                          _yearController.clear();
                          _isbnController.clear();
                        }
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
