import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_builder/theme/themes.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.imagePath,required this.name,required this.designation,required this.bio});
  final String? name,designation,bio;
  final File imagePath;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile Builder', style: AppTextTheme.appBarText),
          centerTitle: true,
        ),
        body: Text('${widget.name}'),
    );
  }
}