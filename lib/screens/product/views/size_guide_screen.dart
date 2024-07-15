import 'package:e_commerce_project/components/components.dart';
import 'package:flutter/material.dart';

class SizeGuideScreen extends StatefulWidget {
  static const routeName = 'ProductReturnsScreenView';

  const SizeGuideScreen({super.key});

  @override
  State<SizeGuideScreen> createState() => _SizeGuideScreenState();
}

class _SizeGuideScreenState extends State<SizeGuideScreen> {
  bool _isShowCentimetersSize = false;

  void updateSizes() {
    setState(() {
      _isShowCentimetersSize = !_isShowCentimetersSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
