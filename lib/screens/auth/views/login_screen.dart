import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_project/screens/auth/views/password_recovery_screen.dart';
import 'package:e_commerce_project/screens/auth/views/signup_screen.dart';
import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/constants.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreenView';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_dark.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Entrez vos données pour vous connecter",
                  ),
                  const SizedBox(height: defaultPadding),
                  LogInForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  Align(
                    child: TextButton(
                      child: const Text("Mot de passe oublié"),
                      onPressed: () {
                        locator<NavigationService>()
                            .navigateTo(PasswordRecoveryScreen.routeName);
                      },
                    ),
                  ),
                  SizedBox(
                    height:
                        size.height > 700 ? size.height * 0.1 : defaultPadding,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          LoginEvent(authData: {
                            "email": _emailController.text,
                            'password': _passwordController.text,
                          }),
                        );
                      }
                    },
                    child: const Text("Se connecter"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous n'avez pas de compte?"),
                      TextButton(
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo(SignUpScreen.routeName);
                        },
                        child: const Text("S'inscrire"),
                      ),
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
