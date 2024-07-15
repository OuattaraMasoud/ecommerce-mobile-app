import 'package:flutter/material.dart';

import '../../../../../../constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (lastName) {
              // Email
            },
            controller: lastNameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Nom",
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: Icon(Icons.info_outlined)),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (firstName) {
              // Email
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: firstNameController,
            decoration: InputDecoration(
              hintText: "Prénom",
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: Icon(Icons.info_outlined)),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (emal) {
              // Email
            },
            validator: emaildValidator.call,
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Adresse Email",
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: Icon(Icons.mail_outline_rounded)),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (pass) {
              // Password
            },
            validator: passwordValidator.call,
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Mot de passe",
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: Icon(Icons.lock_outline)),
            ),
          ),
        ],
      ),
    );
  }
}
