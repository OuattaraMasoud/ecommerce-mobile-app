import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/screens/auth/views/login_screen.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/components.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = 'SignUpScreenView';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/signUp_dark.png",
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Commençons!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Veuillez entrez vos informations correctes pour créer un compte",
                  ),
                  const SizedBox(height: defaultPadding),
                  SignUpForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    lastNameController: _lastNameController,
                    firstNameController: _firstNameController,
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {},
                        value: false,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "J'accepte les",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: " Politique de Confidentialité",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "& les regles générales d'utilisation",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          RegisterEvent(userData: {
                            "email": _emailController.text,
                            'password': _passwordController.text,
                            'firstName': _firstNameController.text,
                            'lastName': _lastNameController.text,
                          }),
                        );
                      }
                    },
                    child: const Text("Continuer"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous avez déja un compte?"),
                      TextButton(
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo(LoginScreen.routeName);
                        },
                        child: const Text("Se connecter"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
