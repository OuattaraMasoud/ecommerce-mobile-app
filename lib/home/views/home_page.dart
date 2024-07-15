import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_project/utils.dart';
import 'package:e_commerce_project/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'HomePageView';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(context,
            title: Text(
              'Bonjour',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
            )),
        body: Container());
  }
}
