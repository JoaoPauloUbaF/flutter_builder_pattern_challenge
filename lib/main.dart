import 'package:flutter/material.dart';

import 'User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Builder Pattern Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser() {
    UserDirector director = UserDirector();
    int? age = int.tryParse(_ageController.text);

    if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid age.')),
      );
      return;
    }

    if (age < 18) {
      director.setUserBuilder(KidUserBuilder());
    } else {
      director.setUserBuilder(AdultUserBuilder());
    }

    director.registerUser(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      age: age,
      phoneNumber: _phoneController.text,
      address: _addressController.text,
    );

    User registeredUser = director.getUser();

    // Display the registered user details (just for this example)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Registered User'),
        content: Text(
            'Name: ${registeredUser.getFirstName} ${registeredUser.getLastName}\nEmail: ${registeredUser.getEmail}\nAge: ${registeredUser.getAge}\nPhone: ${registeredUser.getPhoneNumber}\nAddress: ${registeredUser.getAddress}'),
      ),
    );
  }
}
