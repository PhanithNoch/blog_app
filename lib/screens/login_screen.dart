import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Spacer(),
              Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/1/13/Wattpad_logo.png'),
              const Text(
                'Welcome to Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                obscureText: obscureText,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        icon: Icon(Icons.remove_red_eye))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            controller.login(
                                emailController.text, passController.text);
                          },
                          child: Text('Login')))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account ?'),
                  InkWell(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
