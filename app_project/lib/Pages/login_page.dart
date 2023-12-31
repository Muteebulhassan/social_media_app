import 'package:app_project/Components/app_button.dart';
import 'package:app_project/Components/square_tile.dart';
import 'package:app_project/Components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign user in
  void signUserIn() async {
    //loading circle

    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      showMessage(e.code);
    }
  }

  //Showing error to user

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
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
                height: 50,
              ),
              //Icon

              Icon(
                Icons.lock,
                size: 100,
              ),

              SizedBox(
                height: 40,
              ),

              //Greeting text

              Text(
                'Welcome back you\'ve been missed!',
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

              //Forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),

              //Login button
              MyButton(
                text: 'Sign In',
                onTap: signUserIn,
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
                    'Not a member?',
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
                      'Register Now',
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
