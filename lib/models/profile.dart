import 'dart:io';

class Profile{
  final String name;
  final String designation;
  final String bio;
  final File image;

  Profile({
    required this.name,
    required this.designation,
    required this.bio,
    required this.image
  });
}