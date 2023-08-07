import 'package:flutter/material.dart';


class Qualification {
  String title;
  String grade;
  String description;

  Qualification(this.title, this.grade, this.description);
}

class MyqualificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qualification App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QualificationForm(),
    );
  }
}

class QualificationForm extends StatefulWidget {
  @override
  _QualificationFormState createState() => _QualificationFormState();
}

class _QualificationFormState extends State<QualificationForm> {
  final _formKey = GlobalKey<FormState>();
  List<Qualification> qualifications = [];

  String _title = '';
  String _grade = '';
  String _description = '';

  void _addQualification() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Qualification qualification = Qualification(_title, _grade, _description);

      setState(() {
        qualifications.add(qualification);
      });

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Qualifications')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Qualification Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a qualification title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Grade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a grade';
                  }
                  return null;
                },
                onSaved: (value) {
                  _grade = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addQualification,
                child: Text('Add Qualification'),
              ),

              SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: qualifications.map((qualification) {
                  return Card(
                    child: ListTile(
                      title: Text(qualification.title),
                      subtitle: Text('Grade: ${qualification.grade}\nDescription: ${qualification.description}'),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
