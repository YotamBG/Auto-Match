import 'package:flutter/material.dart';
import '../services/auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  // Function to handle the sign-in action
  Future<void> signIn() async {
    // Implement your sign-in logic here
    final email = _emailController.text;
    final password = _passwordController.text;
    // Perform authentication and navigate to the next screen
    print(email);
    print(password);


    final signInStatus = await signInReq(
      email: email,
      password: password,
    );

    print('Sign-In Status: $signInStatus');

    //move to the next screeen
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
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
          // Sign-in button
          ElevatedButton(
            onPressed: signIn,
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
