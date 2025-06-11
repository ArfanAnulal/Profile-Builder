import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_builder/models/profile.dart';
import 'package:profile_builder/pages/portfoliopage.dart';
import 'package:profile_builder/theme/themes.dart';
import 'package:profile_builder/widgets/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> textFieldData = [
    {'label': 'Name', 'hint': 'Enter Your Name'},
    {'label': 'Designation', 'hint': 'e.g., Flutter Developer'},
    {'label': 'Bio', 'hint': 'Tell Us About Yourself'},
  ];
  final Map<String, TextEditingController> controllers = {
  'Name': TextEditingController(),
  'Designation': TextEditingController(),
  'Bio': TextEditingController(),
};
  File? _selectedImage;
  

  void _submitForm(){
    final isFormValid = _formKey.currentState!.validate();
    if (_selectedImage == null || !isFormValid){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: const Text('Invalid input, try again!')));
            return;
    }
    final profileData = Profile(
    name: controllers['Name']!.text, 
    designation: controllers['Designation']!.text, 
    bio: controllers['Bio']!.text, 
    image: _selectedImage!);
    
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PortfolioPage(
        profile: profileData,
      ),
    ),
  );
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }                          

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile Builder', style: AppTextTheme.appBarText),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Card(
                  margin: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Theme.of(context).cardColor,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Enter Details',
                            style: AppTextTheme.formHeading,
                          ),
                        ),
                        ...List.generate(textFieldData.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(minLines: 1,maxLines: null,keyboardType: TextInputType.multiline,
                              controller: controllers[textFieldData[index]['label']]!,
                              style: TextStyle(
                                color: AppTextTheme.textFieldFontColor,
                              ),
                              decoration: InputDecoration(
                                label: Text(textFieldData[index]['label']!),
                                hint: Text(
                                  textFieldData[index]['hint']!,
                                  style: AppTextTheme.fieldText,
                                ),
                              ),
                              validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your ${textFieldData[index]['label']?.toLowerCase()}';
                                  }
                                  return null;
                                },
                            ),
                          );
                        }),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ImagePickerWidget(
                                  onImageSelected: (File image) {
                                    setState(() {
                                      _selectedImage = image;
                                    });
                                  },
                                ),
                                SizedBox(width: 20),  
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  child: Text('Submit'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
