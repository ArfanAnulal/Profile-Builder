import 'package:flutter/material.dart';
import 'package:profile_builder/theme/themes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('Profile Builder', style: AppTextTheme.appBarText,), ),
        body: Form(
        key: _formKey,
        child:Center(
          child: SizedBox(width: 300, height: 300,
            child: Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            child: Align(alignment: Alignment.topLeft,child: Text('Enter Details',style: AppTextTheme.formHeading)),
                          ),
                          TextFormField(decoration: InputDecoration(label: Text('Name'),hint: Text('Enter name', style: AppTextTheme.fieldText,)),),
                          SizedBox(height: 10,),
                          TextFormField(decoration: InputDecoration(label: Text('Age'),hint: Text('Enter age', style: AppTextTheme.fieldText,)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        ),
      ),
    );
  }
}