import 'package:flutter/material.dart';
import 'package:profile_builder/models/profile.dart';
import 'package:profile_builder/theme/themes.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    super.key,
    required this.profile,
  });
  final Profile profile;

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Theme.of(context).cardColor,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, right: 16,left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'profile-pic',
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(widget.profile.image),
                    ),
                  ),
                  Text(widget.profile.name,style:AppTextTheme.bioName),
                  Text(widget.profile.designation,style:AppTextTheme.bioDesignation),
                  Container(
                    margin: EdgeInsets.only(bottom: 40, top: 20),child: Text(widget.profile.bio,style:AppTextTheme.bioBio)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
