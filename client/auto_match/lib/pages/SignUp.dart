import 'package:flutter/material.dart';
import '../services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> signUp() async {
    //show loading
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        content: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    // Implement your sign-in logic here
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    final bio = _bioController.text;
    final location = _locationController.text;
    final age = _ageController.text;
    // Perform authentication and navigate to the next screen
    print(email);
    print(password);
    print(name);
    print(bio);
    print(location);
    print(age);

    // send req to server
    final signUpStatus = await signUpReq(
      email: email,
      password: password,
      name: name,
      bio: bio ,
      location: location,
      age: int.parse(age)
    );

    final signInStatus = await signInReq(
      email: email,
      password: password,
    );

    print('Sign-Up Status: $signUpStatus');
    print('Sign-In Status: $signInStatus');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen

    Navigator.pushNamed(context, '/faces');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: [
          // Email input field
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          // Password input field
          TextFormField(
            controller: _passwordController,
            obscureText: true, // Hide the password text
            decoration: InputDecoration(labelText: 'Password'),
          ),
          // Name input field
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          // Age input field
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
          ),
          // Bio input field
          TextFormField(
            controller: _bioController,
            decoration: InputDecoration(labelText: 'Bio'),
          ),
          // location input field
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'location'),
          ),
          // Sign-in button
          ElevatedButton(
            onPressed: signUp,
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
