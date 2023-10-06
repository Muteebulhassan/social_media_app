import 'package:app_project/Components/app_button.dart';
import 'package:app_project/Components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Components/square_tile.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  SignUpPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  
  //Sign user in
  void signUserUp() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              //Icon

              Icon(
                Icons.person,
                size: 100,
              ),

              SizedBox(
                height: 40,
              ),

              //Greeting text

              Text(
                'Let\'s create an account for you',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //Email textfield
              MyTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),

              SizedBox(
                height: 10,
              ),

              //password textfield

              MyTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),

              SizedBox(
                height: 10,
              ),

              //password textfield

              MyTextField(
                controller: confirmPasswordController,
                obscureText: true,
                hintText: 'Confirm Password',
              ),

              SizedBox(
                height: 25,
              ),

              //Login button
              MyButton(
                text: 'Sign Up',
                onTap: signUserUp,
              ),

              SizedBox(
                height: 50,
              ),

              //Or continue text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),
              //google + facebook signup button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Google
                  SquareTile(imagePath: 'lib/Images/Google.png'),
                  SizedBox(
                    width: 25,
                  ),
                  //Facebook
                  SquareTile(imagePath: 'lib/Images/facebook.png')
                ],
              ),

              SizedBox(
                height: 40,
              ),

              //Already a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
