import 'package:e_commerce_project/constants.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    required this.emailController,
    required this.passwordController,
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            onSaved: (emal) {
              // Email
            },
            validator: emaildValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Adresse Email",
              prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                  child: Icon(Icons.mail_outline)),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (pass) {
              // Password
            },
            controller: passwordController,
            validator: passwordValidator.call,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Mot de passe",
              prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                  child: Icon(Icons.lock_outline)),
            ),
          ),
        ],
      ),
    );
  }
}
