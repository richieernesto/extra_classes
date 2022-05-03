import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Course with ChangeNotifier {
  final String id;
  final String title;
  final String thumbnail;
  final String description;
  final double price;
  final String nametutor;
  final String schoolOftutor;

  Course({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.price,
    required this.nametutor,
    required this.schoolOftutor,
  });
}
