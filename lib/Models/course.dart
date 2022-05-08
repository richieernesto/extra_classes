import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Course with ChangeNotifier {
  final String id;
  final String title;
  final String thumbnail;
  final String description;
  final String category;
  final double price;
  final String grade_or_class;
  final String nametutor;
  final String schoolOftutor;

  Course({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.category,
    required this.price,
    required this.grade_or_class,
    required this.nametutor,
    required this.schoolOftutor,
  });
}
