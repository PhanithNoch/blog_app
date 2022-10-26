import 'package:blog_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
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
              Spacer(),
              Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/1/13/Wattpad_logo.png'),
              const Text(
                'Welcome to Sigup',
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
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Name",
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
                            controller.register(emailController.text,
                                nameController.text, passController.text);
                          },
                          child: Text('Sign up')))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ?'),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      'Login',
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
